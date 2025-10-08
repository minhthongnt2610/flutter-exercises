package vn.edu.stu.sendobjectdemo;

import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.widget.TextView;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import vn.edu.stu.sendobjectdemo.model.student;

public class getInfoStudent extends AppCompatActivity {

    TextView txtInfo;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_get_info_student);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });
        addControls();
        getDataFromIntend();
    }

    private void getDataFromIntend() {
        txtInfo = findViewById(R.id.txtInfo);
    }

    private void addControls() {
        Intent intent = getIntent();
        if(intent.hasExtra("student")){
            student st;
            if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU){
                st = (student) intent.getSerializableExtra("student", student.class);
            } else {
                st = (student) intent.getSerializableExtra("student");
            }
            txtInfo.setText(st.toString());
        }
    }
}