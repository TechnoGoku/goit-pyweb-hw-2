# Docker-команда FROM вказує базовий образ контейнера
# Наш базовий образ - це Linux з попередньо встановленим python
FROM python:3.12.3

# Встановимо змінну середовища
ENV APP_HOME /hw_2

# Встановимо робочу директорію всередині контейнера
WORKDIR $APP_HOME

# Встановимо залежності всередині контейнера
COPY pyproject.toml $APP_HOME/pyproject.toml
COPY poetry.lock $APP_HOME/poetry.lock

RUN pip install poetry 
RUN poetry config virtualenvs.create false && poetry install --only main 

# Скопіюємо інші файли в робочу директорію контейнера
COPY . .

# Позначимо порт, де працює застосунок всередині контейнера
EXPOSE 3000

# Запустимо наш застосунок всередині контейнера
ENTRYPOINT ["python", "hw_2.py"]
