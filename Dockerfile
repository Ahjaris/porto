# Gunakan image dasar Python
FROM python:3.12

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Buat direktori kerja di dalam container
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Salin kode aplikasi ke direktori kerja
COPY . /app/

# Jalankan perintah untuk mengumpulkan static files
RUN python manage.py collectstatic --noinput

# Ekspos port yang digunakan oleh aplikasi Django
EXPOSE 8000

# Perintah untuk menjalankan aplikasi Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
