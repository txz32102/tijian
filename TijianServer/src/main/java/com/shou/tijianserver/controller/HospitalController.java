package com.shou.tijianserver.controller;

import com.shou.tijianserver.entity.Hospital;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.List;

@RestController
public class HospitalController {

    @GetMapping("/hospital/getAll")
    public List<Hospital> getAllHospitals() {
        // Mock data for testing
        Hospital hospital1 = new Hospital(1, "Hospital A", "08:00-17:00", "12:00", "123456789", "Address A", "hospital_a.png");
        Hospital hospital2 = new Hospital(2, "Hospital B", "09:00-18:00", "13:00", "987654321", "Address B", "hospital_b.png");
        return Arrays.asList(hospital1, hospital2);
    }
}
