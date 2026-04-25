Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2332F90C5
	for <tools@linux.kernel.org>; Sat, 25 Apr 2026 19:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777146607; cv=none; b=hZEj4I2VGvysDYwn+pNXt8MEx62A4edLL87NImxYAQl6Lf0usWB61FVD95gAp97/RGf8NZ5H3ydhQOw8DarWjcQvFzucY/Rdz+LpZvSAPxnakHjNsbbFEws4UR0lWDM69o5UrG71ifYSp5fEE+jnKEQOfrjw8FDAV80sLYeswMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777146607; c=relaxed/simple;
	bh=eycaivmIHAm3mA1Wrj7PUw8Z0v8QfFjO2iq6WYmoR/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t+qyPvmXE3n8YqvFHHDwaLyE6ARPy86eRQfDnAiawHnmx/KBLJHAq0jCwO6Xh+JspHlEexYxCvL5qzvgJi8HMcjst5BkQzLRVuI/5Q8pN1IX3p6v9PUaasPooYvMM8n6hzBqm7HTo3XRRKXF4VCgUmC1DqXddPnh1WyGjxghTFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0tydcF1; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0tydcF1"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12714f01940so664361c88.0
        for <tools@linux.kernel.org>; Sat, 25 Apr 2026 12:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777146606; x=1777751406; darn=linux.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcbZ0l18pYUv1GK2qsaw67u1guHoOvqsM+uwgfC1aoo=;
        b=L0tydcF1RaZGQonsXmjaLI9rRUgP+tHs+nbqav6dZiav1zTApCoq7eFn95mTVf0ST7
         0Z9KDiNEZsGLkkoXQm5yXrkuUIzNrZowZL8CXXwVVk3ntUGqGfTFDXWpjTrxK3bdDbmk
         Cmofw9rQbYQYcibXV3dVISm5j/hXyREP0hexNhhzPz8kHnhOYm9wzmo92rCCP6ZIIcyb
         Z2cTYy/qSZ49xgFNaABsnyDWv7/oNNbLAgEQWlEtNqap3+cVSX6KYRGRsaff8XQC8EfE
         njLQDxgqGRxkdaK+O3wH5vFpFRVeOFtueL5Oh6pZFSD7TgnfvG2Z3ayphcXAEgUyFA+j
         /ilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146606; x=1777751406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wcbZ0l18pYUv1GK2qsaw67u1guHoOvqsM+uwgfC1aoo=;
        b=ssBjrLBg1nhOQeJ/6j0FIenjcsNDPxPp+JhXQQrevoI9gt4kOJEngaNK+P7+1GZ8Hf
         dn6NruXkFElzrLO8nnWtNNDcjQQtmJ1IAOIkX+b+WBhIDc/2W0+nkoLQFMG7oE8W9FyT
         WiTIZshd5m/WYgAKqryCDNuq39c/380nxrApqvFYTGn6fOgHI+4V1qqi8T0ZUV1gRofS
         lWyePEmudPotVgPeBhRQtJgnsIrSSqockA+iDI6xaXH8RV25QFIcBIoFmfpmHybTypHB
         Wt58zOvQRPhm5dnR5bAS9xAAmLeYQgqmrsas/XjgHIqxNicob0G/MKcV67/CY9enA7aN
         bJ4A==
X-Gm-Message-State: AOJu0Yz0LYc8iA8e/iOWORdLbzauJRAICVWx5UyGaavxByRETpBxSps7
	gz3l4GhumG1Gz18pBlkwwq8A+2Hj/sDXqByWk6rut24JL5I0y4lCzYJR7uJbXQ==
X-Gm-Gg: AeBDieufpbSl+ojsNBU6FazRGWFavMCOvrPB+AmpD87N+2I6DrguQZJhCSmq+Q5PnAM
	3KbvDfTWf4W8Sx6NkjU+JVV6a+ZoJlpEZiCJK7ZxzuA18JuZRO82S9XKy0u2gmOO9ARJyhZR4EQ
	/L4v4APOHaR2FD+M4E+ILL3d8BTGDSeCCYjJecUpgeMvq27/1SVOz0iJ1N6Qy+SfDxNzNpaFFoJ
	uPPXndh7r3BiKpLG0OsfeVoMFNBqQZE6FTeusj9XVLQKToY9kz64cjZclmsB+W+6fqDH2EghJSD
	wD3C/FOZfdx9II1m6t13QG2kSSD3oMW+rrPtwuZZ2R6LRu/qVENtt9JfmPLa9VlhBE3y619Awtd
	/g4VIGMYrIsGJSGd+PG1BGN0CUNvPaAhVfmNupN9AvlPicvHd29n93oag2JjDCyS9gdavlUffob
	1rZl5b0/6SvjY8oBXX0fZeEH+phg2qRti41MUDlLQgK7lM1e059iO46dO9hZudPIvBOhPt5XXdp
	kraXr7VR6PgbEIsR025GlyzEb9I2lXo+oI=
X-Received: by 2002:a05:7022:90d:b0:12c:900b:9dee with SMTP id a92af1059eb24-12c900ba4bamr5712832c88.1.1777146605514;
        Sat, 25 Apr 2026 12:50:05 -0700 (PDT)
Received: from localhost.localdomain (187.250.115.107.dsl.dyn.telnor.net. [187.250.115.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a20eb5sm48512078c88.14.2026.04.25.12.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:50:04 -0700 (PDT)
From: Adrian Neftali Sanchez <lutgaru@gmail.com>
To: tools@linux.kernel.org
Cc: konstantin@linuxfoundation.org,
	Adrian Neftali Sanchez <lutgaru@gmail.com>
Subject: [RFC PATCH 08/13] tui: The _suspend_to_shell function assumes a POSIX environment, relying on $SHELL and shell-specific arguments (e.g., --rcfile) that are invalid on Windows.
Date: Sat, 25 Apr 2026 12:49:36 -0700
Message-ID: <20260425194943.1499-9-lutgaru@gmail.com>
X-Mailer: git-send-email 2.45.0.windows.1
In-Reply-To: <20260425194943.1499-1-lutgaru@gmail.com>
References: <20260425194943.1499-1-lutgaru@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the execution flow to branch on sys.platform. On Windows,
launch the native interpreter via COMSPEC (defaulting to cmd.exe).
Move the existing POSIX-specific logic for bash/zsh into an explicit
else-block to ensure clean separation of platform execution paths.

This enables Windows support while preventing POSIX shell configuration
side effects on non-POSIX systems.

Signed-off-by: Adrian Neftali Sanchez <lutgaru@gmail.com>
---
 src/b4/tui/_common.py | 58 ++++++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 26 deletions(-)

diff --git a/src/b4/tui/_common.py b/src/b4/tui/_common.py
index cdd3818..6c8042c 100644
--- a/src/b4/tui/_common.py
+++ b/src/b4/tui/_common.py
@@ -10,6 +10,7 @@ __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
 import email.utils
 import os
 import subprocess
+import sys
 import tempfile
 import unicodedata
 from collections import defaultdict
@@ -198,36 +199,41 @@ def _suspend_to_shell(hint: str = 'b4', cwd: Optional[str] = None) -> None:
     logger.info('When done, Ctrl-d to return to review UI.')
     logger.info('---')
 
-    shell = os.environ.get('SHELL', '/bin/sh')
-    shellname = os.path.basename(shell)
     env = os.environ.copy()
     env['B4_REVIEW'] = hint
 
-    if shellname == 'bash':
-        bashrc = os.path.expanduser('~/.bashrc')
-        source = f'[ -f {bashrc} ] && . {bashrc}\n'
-        source += f'PS1="({hint}) $PS1"\n'
-        with tempfile.NamedTemporaryFile(
-            mode='w', prefix='b4-shell-', suffix='.sh', delete=False
-        ) as rcf:
-            rcf.write(source)
-            rcfile = rcf.name
-        try:
-            subprocess.run([shell, '--rcfile', rcfile], env=env, cwd=cwd)
-        finally:
-            os.unlink(rcfile)
-    elif shellname == 'zsh':
-        real_zdotdir = os.environ.get('ZDOTDIR', os.path.expanduser('~'))
-        with tempfile.TemporaryDirectory(prefix='b4-shell-') as tmpdir:
-            zshrc = os.path.join(tmpdir, '.zshrc')
-            with open(zshrc, 'w') as f:
-                f.write(f'ZDOTDIR="{real_zdotdir}"\n')
-                f.write('[ -f "$ZDOTDIR/.zshrc" ] && . "$ZDOTDIR/.zshrc"\n')
-                f.write(f'PS1="({hint}) $PS1"\n')
-            env['ZDOTDIR'] = tmpdir
-            subprocess.run([shell], env=env, cwd=cwd)
-    else:
+    if sys.platform == 'win32':
+        shell = os.environ.get('COMSPEC', 'cmd.exe')
         subprocess.run([shell], env=env, cwd=cwd)
+    else:
+        shell = os.environ.get('SHELL', '/bin/sh')
+        shellname = os.path.basename(shell)
+
+        if shellname == 'bash':
+            bashrc = os.path.expanduser('~/.bashrc')
+            source = f'[ -f {bashrc} ] && . {bashrc}\n'
+            source += f'PS1="({hint}) $PS1"\n'
+            with tempfile.NamedTemporaryFile(
+                mode='w', prefix='b4-shell-', suffix='.sh', delete=False
+            ) as rcf:
+                rcf.write(source)
+                rcfile = rcf.name
+            try:
+                subprocess.run([shell, '--rcfile', rcfile], env=env, cwd=cwd)
+            finally:
+                os.unlink(rcfile)
+        elif shellname == 'zsh':
+            real_zdotdir = os.environ.get('ZDOTDIR', os.path.expanduser('~'))
+            with tempfile.TemporaryDirectory(prefix='b4-shell-') as tmpdir:
+                zshrc = os.path.join(tmpdir, '.zshrc')
+                with open(zshrc, 'w') as f:
+                    f.write(f'ZDOTDIR="{real_zdotdir}"\n')
+                    f.write('[ -f "$ZDOTDIR/.zshrc" ] && . "$ZDOTDIR/.zshrc"\n')
+                    f.write(f'PS1="({hint}) $PS1"\n')
+                env['ZDOTDIR'] = tmpdir
+                subprocess.run([shell], env=env, cwd=cwd)
+        else:
+            subprocess.run([shell], env=env, cwd=cwd)
 
 
 def _addrs_to_lines(header_str: str) -> str:
-- 
2.45.0.windows.1

