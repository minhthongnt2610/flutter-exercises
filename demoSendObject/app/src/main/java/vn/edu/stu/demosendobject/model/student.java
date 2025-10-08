package vn.edu.stu.demosendobject.model;

import org.jspecify.annotations.NonNull;

import java.io.Serializable;

public class student implements Serializable {
    private  int id;
    private  String name;
    private  double score;

    public student(int id, String name, double score) {
        this.id = id;
        this.name = name;
        this.score = score;
    }

    public  student() {
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public double getScore() {
        return score;
    }
    public void setScore(double score) {
        this.score = score;
    }
    @NonNull
    @Override
    public String toString() {
        return "student [id=" + id + ", name=" + name + ", score=" + score + "]";
    }


}

