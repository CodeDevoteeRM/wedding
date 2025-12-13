# Свадебное приглашение - скрипт обновления сайта
Write-Host "🔄 Начинаю обновление сайта..." -ForegroundColor Yellow

# 1. Собрать проект
Write-Host "📦 Собираю проект Flutter..." -ForegroundColor Cyan
cd wedding_invitation
flutter build web --release --base-href=/wedding/

# 2. Очистить папку сайта
Write-Host "🧹 Очищаю старые файлы..." -ForegroundColor Cyan
cd ..\temp_site
Remove-Item * -Recurse -Force -ErrorAction SilentlyContinue

# 3. Скопировать новые файлы
Write-Host "📁 Копирую новые файлы..." -ForegroundColor Cyan
$source = "..\wedding_invitation\build\web\*"
Copy-Item -Path $source -Destination "." -Recurse

# 4. Обновить репозиторий
Write-Host "📤 Отправляю на GitHub..." -ForegroundColor Cyan
git add .
git commit -m "Обновление сайта $(Get-Date -Format 'dd.MM.yyyy HH:mm')"
git push origin master

Write-Host "✅ Сайт успешно обновлён!" -ForegroundColor Green
Write-Host "🌐 Ссылка: https://CodeDevoteeRM.github.io/wedding/" -ForegroundColor Green



#  обновление сайта:

# Собрать проект в wedding_invitation/

# Скопировать в temp_site/

# git add ., commit, push