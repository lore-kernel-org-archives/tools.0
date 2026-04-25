Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C33D3016EE
	for <tools@linux.kernel.org>; Sat, 25 Apr 2026 19:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777146603; cv=none; b=Vz97co6gQXuyQnuiil59KQUJcX7WiAKiOftSsEv5n79mWNHMZ7lDPzURexqXyJ8HYBah1frwog0C0k6WXpX7oP8HYaSgMRiglYPph2W2yjWb/0q73M30Dr7+XQuS0jyq3k+pTJb4k5FpoH5HCLmR5pptczlZcBE9TisSjbHUY0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777146603; c=relaxed/simple;
	bh=W3Rp1mkub0ZAQRxhV/1r+L/GQlDoTcSqZulbrqsnDhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gJc6qTU+qGCRaPLXJVcP3B/gZq+AtZw9ckpZd562lEJ9vdZgWmxbUE1xmOhQiwcv1gHC6RBzuSPW1orzaw5+z2LpMbOZaCBX7KQ3J5l9Tf9I7RIZMoydHwEOJsJKoYXCYryWir8/Oa4DxS+WksJtFNwmR6xJu/4s2TbuAfKVjpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBOMTwoL; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBOMTwoL"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12c750eaf4cso548027c88.0
        for <tools@linux.kernel.org>; Sat, 25 Apr 2026 12:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777146601; x=1777751401; darn=linux.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBayqNSbo7Mzjc2xISKwKo96ZcZZBxsROwGNiaAZww4=;
        b=YBOMTwoLHEOdLN9hpUCJfmdEDePumWf0pSzUmbHz59tGreZVPtEiDiEsDIqR3m4rtR
         3o1jSv25q4xU3mWMe9susYdJEhTi0E5/+FuvudCIf2RM4V7wIH205vjCeeE7OaUdLpn5
         RsAzynK3IbivhKA5CJfH38c6Je68x189iTUSvMNC32rolQ71wNXwP5nNHxGEcMcoBAeu
         ruJzZ2nA1+HG2scs7xUFD/sHDA0CxpuKmm5BlZTFFMZz3gjXmeb9NJU/+b0BWAJDLvUL
         Vnp9MTjZ0Ta+bR9dJfmtCgmfpYwsyZaLra5+KjxsyJ+EGYKJSwlIqgXOwa4ta5wTLQ14
         cSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146601; x=1777751401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zBayqNSbo7Mzjc2xISKwKo96ZcZZBxsROwGNiaAZww4=;
        b=BdvUH1MgthQ5ntCimwKsAaC971eTGmIHd49rstapX4iEAftY0UaoPi/o7qiUbIzCGg
         jXOGRDpMuuT0IZH4kZQQMbANRQ20vm6/wqTbtKu5xPCzAwCj8V2RF/zEYDfdMm8uOngT
         55Fgz1QkULZfKZbnB/dOtNLuWLoxrSLGdteleLATKU0caB7iJDFn7+RM3OKVibrSMorO
         E8PkTbPkBxRdBkQ1TVWU/zf3G2SAtPVaRvEkXah5XkrQjsW94c+wQJ4gN+Q1D/5iG6UO
         BV/uzdj74fRcNCnnhovVpYLwEvlXuCLszlUPSyI/QJqkJIeQDGagQCJDIOZn2+HjwN1A
         PYKw==
X-Gm-Message-State: AOJu0Yz5+wmZxQ45/wNY8C+cy6PAukTY4G2NhcaD8+Twnf+2BfCRfAFT
	c71YipIdafIcV/QEAs5DNgO5dd8RhVmARnG6KrWAui+2nEk3VFsINMo5Z1g4+Q==
X-Gm-Gg: AeBDieum5HMgq26ZpLyekTjDH/QoS0f0Aed/T6/5fB1wPe/6spyhs2uSz1NxXIjF9KB
	HQbZi9iBjn0dWrtWx7RYHbbSqiW/k9PQaGEJQgvEfGp1WbHScQkkNN3SDcVap/rNOwfylh2f4r9
	bF2OYO6FC6KSFWzg/r98v3zdEEv8niMHaPTkN4TAbpRHWam10/HrXkyq5wRrORVYKbOOvmn8Rqj
	BE58CIM8ORMmZx0RfO6AAicC/CCMLZSzW9guukGfA2H5pUo+QKcT/pyff5FXiWTLTLDXcMwYS15
	CkC7mw1qRQHKq8pIwjlGwcnoMfIQdSnsuZ+G+YS0gud9ENuP9XA9vXSSJ/2JCUK0afh9LIu2sB8
	RjhmF5yDm7aT1zG0k7HvYjPKlWRODQ6VIBID2yvuq6gJk71BQppVf/nH5QipHfoPU6CCEI3n7tk
	lYx4GlLXl4XT/xOUom0+lx1+BG1/7XC5f6Z0hcKmSf+QvHIWbYUID2FZlHx19OuXiayEsKNwslO
	6HQTS/1C/5gE/lWr6tWUD21
X-Received: by 2002:a05:7022:6988:b0:12c:20b9:80fc with SMTP id a92af1059eb24-12c73fac558mr6040613c88.7.1777146600846;
        Sat, 25 Apr 2026 12:50:00 -0700 (PDT)
Received: from localhost.localdomain (187.250.115.107.dsl.dyn.telnor.net. [187.250.115.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a20eb5sm48512078c88.14.2026.04.25.12.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:50:00 -0700 (PDT)
From: Adrian Neftali Sanchez <lutgaru@gmail.com>
To: tools@linux.kernel.org
Cc: konstantin@linuxfoundation.org,
	Adrian Neftali Sanchez <lutgaru@gmail.com>
Subject: [RFC PATCH 03/13] b4: add cross-platform username resolution in _setup_user_config
Date: Sat, 25 Apr 2026 12:49:31 -0700
Message-ID: <20260425194943.1499-4-lutgaru@gmail.com>
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

On Unix-like systems, obtain the user's display name from pwd.getpwuid()
when GIT_COMMITTER_NAME and GIT_AUTHOR_NAME are not set.  Parse pw_gecos
to extract only the full name field (before the first comma) per POSIX
conventions.

On Windows, where pwd and os.getuid() are unavailable, fall back to the
USERNAME environment variable.  Use explicit sys.platform != 'win32' guards
so static type checkers (mypy, pyright, ruff) correctly recognize platform-
specific APIs without 'possibly unbound' or 'attr-defined' diagnostics.

This enables b4 to initialize USER_CONFIG['name'] reliably across all
supported platforms without raising ImportError or AttributeError.

Signed-off-by: Adrian Neftali Sanchez <lutgaru@gmail.com>
---
 src/b4/__init__.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 0530fec..e878d34 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -17,7 +17,6 @@ import logging
 import mailbox
 import os
 import pathlib
-import pwd
 import re
 import shlex
 import shutil
@@ -4007,9 +4006,15 @@ def _setup_user_config(cmdargs: argparse.Namespace) -> None:
             USER_CONFIG['name'] = os.environ['GIT_COMMITTER_NAME']
         elif 'GIT_AUTHOR_NAME' in os.environ:
             USER_CONFIG['name'] = os.environ['GIT_AUTHOR_NAME']
-        else:
+        elif sys.platform != 'win32':
+            # Unix-like: pwd and os.getuid() are guaranteed in this branch
+            import pwd
             udata = pwd.getpwuid(os.getuid())
-            USER_CONFIG['name'] = udata.pw_gecos.strip(',')
+            # pw_gecos is typically "Full Name,Office,Phone,...". Extract just the name.
+            USER_CONFIG['name'] = udata.pw_gecos.split(',', 1)[0].strip()
+        else:
+            # Windows fallback
+            USER_CONFIG['name'] = os.environ.get('USERNAME', 'unknown')
     if 'email' not in USER_CONFIG:
         if 'GIT_COMMITTER_EMAIL' in os.environ:
             USER_CONFIG['email'] = os.environ['GIT_COMMITTER_EMAIL']
-- 
2.45.0.windows.1

