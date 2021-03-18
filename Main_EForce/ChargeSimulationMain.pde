Object[] objects;
BufferedReader reader;
PrintWriter output;
String line;

void setup(){
  fullScreen();
  load_data(reader,"Charge data.txt");
  display_charges(objects);
  export_data(output,"Export data.txt","Coulomb Force.jpg");
}

public void load_data(BufferedReader r, String file_name){
  r = createReader(file_name);
  
  try{
    line = r.readLine();
  }
  catch (IOException e){
     line = null; 
  }
  
  if(line != null){
    objects = new Object[int(line)];
    for(int i = 0;i < objects.length;i++){
      try{
        line = r.readLine();
        }
      catch(IOException e){}
      String[] pieces = split(line," ");
      objects[i] = new Object(float(pieces[0]),float(pieces[1]),
                              float(pieces[2]),float(pieces[3]));             
    }
  }
}

public void export_data(PrintWriter writer, String text_file, String picture_file){
     writer = createWriter(text_file);
     save(picture_file);
     for(int i = 0;i < objects.length;i++){
        writer.println("Forces exerted on Q" + i + ":");
        objects[i].export_forces(writer);
     }
     writer.flush();
     writer.close();
}

public void display_charges(Object[] o){
  for(int i = 0;i < o.length;i++){
     for(int k = i + 1; k< o.length;k++){
       objects[i].compute_force(objects[k],i,k);
    }
  }
  
   for(Object e: o){
    if(e != null){
     e.display_object(); 
    }
  }
}
