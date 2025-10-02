package vn.edu.stu.practiceintent_senddata;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class activity1 extends AppCompatActivity {

    EditText edtData;
    Button button;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_1);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });
        addControls();
        addEvents();
    }
    private void addControls() {
        edtData = findViewById(R.id.edtData);
        button = findViewById(R.id.button);
    }

    private void addEvents() {

        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                int data = Integer.parseInt(edtData.getText().toString());
                Intent intent = new Intent(activity1.this, Activity2.class);
                intent.putExtra("data", data);
                startActivity(intent);
            }
        });
    }
}