package vn.edu.stu.sendobjectdemo;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import vn.edu.stu.sendobjectdemo.model.student;

public class MainActivity extends AppCompatActivity {

    EditText editId, editName, editScore;
    Button btnSend;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_main);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });
        addControls();
        addEvents();
    }

    private void addControls() {
        editId = findViewById(R.id.editId);
        editName = findViewById(R.id.editName);
        editScore = findViewById(R.id.editScore);
        btnSend = findViewById(R.id.btnSend);
    }

    private void addEvents() {
        btnSend.setOnClickListener(v -> {
            int id = Integer.parseInt(editId.getText().toString());
            String name = editName.getText().toString();
            double score = Double.parseDouble(editScore.getText().toString());
            student st = new student(id, name, score);
            Intent intent = new Intent(MainActivity.this, getInfoStudent.class);
            intent.putExtra("student", st);
            startActivity(intent);
        });
    }
}