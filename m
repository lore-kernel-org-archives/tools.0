Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E72A3016EE
	for <tools@linux.kernel.org>; Sat, 25 Apr 2026 19:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777146610; cv=none; b=oJFxnctGNQdkPzLYDq5/UAUjG3QS7eR+ZscC4LAxI2ZoxgJHKt1331qGGAqMLEYg4pAk6z9+iab29ZLmjsUsFfw27GVrrQAdZSjIeFagnUfx/0hWQtaw+aqA1WoRSHxd/AZ9bdgDhBQl9T8rdLfm3pb39vaOsYwPMduvZQrvfgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777146610; c=relaxed/simple;
	bh=1R065IKRYFjhJj+pYPvOCK+QDmz7HFjtfnnpdiaHlYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LwWQkgTed4Jmj+5KbEQHAg/J70lSsgVQj4gET39YLvcvvo7QP36SiymZt6SHO81Bl0zCNkA3dPkVDN1Y/Sg8HTht7eUcdDKfdOfNQoRhUpsS5VEg1LOZYylLKmrV3ziW98UqITX9PxduZkmdiqg/siHKnegk5hm2G0Hr/t+wRkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rb8UFzkB; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rb8UFzkB"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12c750eaf4cso548033c88.0
        for <tools@linux.kernel.org>; Sat, 25 Apr 2026 12:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777146608; x=1777751408; darn=linux.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6RXH8tvgNhb1cC7rNUiadREMQ7ApEW6refPydlNwEQ=;
        b=rb8UFzkBOM0iwxvJaXppM9K4XwF1Y1+JRCWqt/t99uAjQAyzaNR7JBfDvKC1yTinY+
         0njOuqp+qtkfSp9vOSYEEy/oAu/ARJDrBlmudxeQlim8BwnqCUZXjayPfHWIb1tPfMM1
         5mUQlJQU0HhwwMAOBcw2+2P378l2CUclqivfXg2ONnQLbJxYHxVRAWTiOa99Be0b4INc
         /2hqbNUwqOTzkWnEC1dKvdXh7zg+pGc0gT2h4FSRu4KFUZLU9LnzlPnMT6x7xevMPLDz
         61qmarapXJcjd8tOfs7UTyASgY98Se9MMvgzVdNapiqbZoFWSkce2bGMOHJhlZwQULq1
         HEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146608; x=1777751408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z6RXH8tvgNhb1cC7rNUiadREMQ7ApEW6refPydlNwEQ=;
        b=S1+uXNO5ZkKzXMhTqD5BWzp7vMDqXBX+GZz43wQFBhNWCjzc+6lqnxl6lmGFancp7X
         8S72oHPdd8Cf1oxnQyLFbOWxCFEaBN3O28M/DAPgDUPBxDjIpDASz7+ojUd0Ek242agR
         zGIlklDN8cIkpwMm+EorhhIWu+aW8xfVeRA8hQnhqAZBehhZCK/0rP6wxLMFE7i5FkrF
         0lnqfxBi7v55U/bWLy3Gz5Cgn7WVWSzXe/oS5e1ZeenYE0UqFDFigCfw4qYEYYKvP6hS
         d6S0Ol9dn4z2qgMdIUBF4J0k6EHIq246U2GHGujHfZH/MJG7obPmnMC4NIMjKWEVVGLk
         uH1Q==
X-Gm-Message-State: AOJu0YyR45fzxGkA5aAJyRmwyH2YfvKc697TG5Sjv/QuCebOFvKsP9kr
	bVjNzv7nEHhcng8O/pnnB4WIZLR7ycsnnDJCsWI25gjteFlKgzk3VKEbdP3M4Q==
X-Gm-Gg: AeBDieuve6NTdHd0+RnRBUTLTz7u9ld+UUX940yH1mm1M8DyXK318mkjzQfocgN/KVS
	X0wpOKRshAWDBBGN9ulu1KVVtBM9PH4PEofLn7Yzp0ADxV8SarFua10GMUxznS9ojWmP7aIlSoo
	Y2GOe6YGBdMh14rUpdqgh6q/RvRdYsLMq+fqhMLyNO2BJyZAIVlMMKM32NqQand6ft+lNM8PpgF
	1z79+TVgN0FVyIq3Viox5cidiJWChqqdgvAyohV9RQgTuIDoKbB/2zihro3p7iyFDfgOHmkyOfq
	yI3KhomHK4iPWQ9uJq+y0920UjLLqz8SKEjzcRQ4nEB7fzMI6tkHBPINc4Y5ao2OJL4H0gtp7E/
	rDBzpu0Exww1M56EMfN1gws7HVJFa7JQDWpFW7zL5tvHFq+oPlbqbAYffGCG8r9EqmSAgFtWChr
	ggUzhttj6lcncG/0fLKAHLt4slcGqqJmOjcIHIKjwvcB9zZFkl7BqNCMYgd6ZR4ymY/yTZ8jUaV
	vxard61n0lncCCIWFXNB/MA
X-Received: by 2002:a05:7022:2522:b0:127:def:dd72 with SMTP id a92af1059eb24-12c73f659d5mr8222920c88.2.1777146608303;
        Sat, 25 Apr 2026 12:50:08 -0700 (PDT)
Received: from localhost.localdomain (187.250.115.107.dsl.dyn.telnor.net. [187.250.115.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a20eb5sm48512078c88.14.2026.04.25.12.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:50:07 -0700 (PDT)
From: Adrian Neftali Sanchez <lutgaru@gmail.com>
To: tools@linux.kernel.org
Cc: konstantin@linuxfoundation.org,
	Adrian Neftali Sanchez <lutgaru@gmail.com>
Subject: [RFC PATCH 11/13] ci: add ci.ps1 for running the quality-gate pipeline on Windows
Date: Sat, 25 Apr 2026 12:49:39 -0700
Message-ID: <20260425194943.1499-12-lutgaru@gmail.com>
X-Mailer: git-send-email 2.45.0.windows.1
In-Reply-To: <20260425194943.1499-1-lutgaru@gmail.com>
References: <20260425194943.1499-1-lutgaru@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Provide a PowerShell equivalent of ci.sh that runs the full quality-gate
pipeline (dependency sync, format check, linting, type checking, tests)
via uv.  This makes it straightforward to validate the Windows port
locally or in a Windows CI environment without requiring a POSIX shell.

Signed-off-by: Adrian Neftali Sanchez <lutgaru@gmail.com>
---
 ci.ps1 | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 ci.ps1

diff --git a/ci.ps1 b/ci.ps1
new file mode 100644
index 0000000..1eaceb7
--- /dev/null
+++ b/ci.ps1
@@ -0,0 +1,15 @@
+#!/usr/bin/env pwsh
+# Windows equivalent of ci.sh — runs the full quality-gate pipeline via uv.
+# Prerequisites: uv (https://docs.astral.sh/uv/), Python 3.11+, Git for Windows.
+
+Set-StrictMode -Version Latest
+$ErrorActionPreference = 'Stop'
+
+uv sync --all-extras --all-groups
+
+uv run ruff format --check
+uv run ruff check
+uv run ty check
+uv run mypy .
+uv run pyright
+uv run pytest --durations=20
-- 
2.45.0.windows.1

