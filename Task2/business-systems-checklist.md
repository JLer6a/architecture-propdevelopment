| Раздел                             | Проверяемый параметр                                   | Значение/Комментарий | Рекомендации                                              |
|------------------------------------|---------------------------------------------------------|-----------------------|------------------------------------------------------------|
| Аутентификация и авторизация      | Централизованный auth-сервис                           | Да                    | Обеспечить 2FA и минимизацию доверенных сессий             |
| Аутентификация и авторизация      | RBAC/ABAC в приложениях                                 | Частично              | Внедрить политику RBAC в Kubernetes и сервисах            |
| Аутентификация и авторизация      | JWT с коротким TTL                                      | Нет                   | Использовать JWT с TTL < 15 минут и refresh-токены        |
| Управление данными                | Шифрование PII в хранилищах и в передаче                | Частично              | Использовать TLS и AES-256 в БД. Masking в логах          |
| Управление данными                | Контроль дубликатов данных клиента                      | Нет                   | Внедрить master-клиент сервис с консолидацией данных       |
| Интеграции                         | Ограничение API-доступа по IP/сети                      | Отсутствует           | Использовать API-gateway и фильтрацию трафика             |
| Интеграции                         | Валидаторы и фильтры входящих данных                    | Частично              | Внедрить строгую валидацию и contract-first подход         |
| Интеграции                         | Отслеживание и аудит вызовов API                        | Частично              | Включить логирование на уровне gateway и сервисов         |
| Логирование и аудит               | Централизованная система логирования                    | Частично              | Использовать ELK, Grafana Loki или аналог                  |
| Логирование и аудит               | Сквозной аудит действий с PII                           | Отсутствует           | Внедрить policy audit trail для операций с PII            |
| Резервное копирование             | Автоматизация и мониторинг резервного копирования       | Да                    | Периодически проверять валидность восстановления          |
| Защита сетевого взаимодействия    | Изоляция сервисов в Kubernetes                          | Частично              | Использовать NetworkPolicy, Calico или Cilium             |
| Защита сетевого взаимодействия    | HTTPS везде, включая внутренние сервисы                 | Частично              | Внедрить TLS между подами и сервисами                     |
| Защита на уровне клиентских приложений | Хранение токенов и сессий                         | Частично              | Хранить в secure storage, запретить в localStorage        |
