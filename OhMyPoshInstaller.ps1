# Oh-My-Posh 프로파일 설정하는 함수
function Set-OhMyPoshProfile 
{
    # 프로파일 파일이 확인 및 예외 처리
    $isProfileExist = Test-Path -Path $PROFILE
    if($isProfileExist -eq $false)
    {
        New-Item -ItemType File -Path $PROFILE -Force
    }

    # 프로파일 작성
    Set-Content $PROFILE "oh-my-posh init pwsh --config `"$env:POSH_THEMES_PATH\paradox.omp.json`" | Invoke-Expression"
}

# Main 함수
function Start-Main
{
    # 1. oh-my-posh 설치
    winget install XP8K0HKJFRXGCK
    
    # 2. 프로파일 설정
    Set-OhMyPoshProfile

    # 3. 보안 정책 설정
    # 보안 정책상 여기서 실행할 수 없음
    Write-Host "Run `"Set-ExecutionPolicy -ExecutionPolicy Unrestricted`""
}

Start-Main