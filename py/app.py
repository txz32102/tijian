from flask import Flask, request, jsonify
import mysql.connector
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# Database configuration
db_config = {
    'user': 'root',
    'password': '123456',  # Replace with your MySQL root password
    'host': 'localhost',
    'database': 'tijian'
}

# Endpoint for user login
@app.route('/user/login', methods=['POST'])
def login():
    user_id = request.args.get('userId')
    password = request.args.get('password')
    
    if not user_id or not password:
        return jsonify({'code': 4000, 'message': 'User ID and password are required'}), 400

    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor(dictionary=True)
        
        query = "SELECT * FROM user WHERE userId = %s AND password = %s"
        cursor.execute(query, (user_id, password))
        user = cursor.fetchone()

        if user:
            response_data = {
                'code': 1000,
                'data': user
            }
        else:
            response_data = {
                'code': 4001,
                'message': 'Invalid user ID or password'
            }

        cursor.close()
        conn.close()
        return jsonify(response_data)

    except mysql.connector.Error as err:
        print(f"Error: {err}")
        return jsonify({'code': 5000, 'message': str(err)}), 500

# Endpoint for user registration
@app.route('/user/register', methods=['POST'])
def register():
    try:
        user_data = request.form.to_dict()
        
        required_fields = ['userId', 'password', 'realName', 'gender', 'identityCard', 'birthday', 'userType']
        if not all(field in user_data for field in required_fields):
            return jsonify({'code': 4000, 'message': 'Missing required fields'}), 400

        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()

        check_query = "SELECT * FROM user WHERE userId = %s"
        cursor.execute(check_query, (user_data['userId'],))
        existing_user = cursor.fetchone()
        if existing_user:
            return jsonify({'code': 1001, 'message': 'User ID already exists'}), 400
        
        insert_query = """
        INSERT INTO user (userId, password, realName, gender, identityCard, birthday, userType)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
        """
        cursor.execute(insert_query, (
            user_data['userId'], user_data['password'], user_data['realName'], 
            user_data['gender'], user_data['identityCard'], user_data['birthday'], user_data['userType']
        ))
        conn.commit()

        cursor.close()
        conn.close()
        return jsonify({'code': 1000, 'message': 'Registration successful'})

    except mysql.connector.Error as err:
        print(f"Database Error: {err}")
        return jsonify({'code': 5000, 'message': str(err)}), 500
    except Exception as e:
        print(f"Error: {e}")
        return jsonify({'code': 5000, 'message': str(e)}), 500

if __name__ == '__main__':
    app.run(port=9080, debug=True)
