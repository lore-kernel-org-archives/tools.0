Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DC32F90C5
	for <tools@linux.kernel.org>; Sat, 25 Apr 2026 19:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777146604; cv=none; b=RFY3eWb1szev05mbyxfMWTkU4hHXKzo7ZdmYd3y3NtXfehng0znVve5mET1cvYYDCO3yjANmr7g8tvznOZu7hKDYNhh56oaRWChXLCKYq9d3E7S0TB92VmtoW5bSJNyO/VeUcGySOnwtC4NHkc6XdLt88yh6blvvQk8sY0xeGNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777146604; c=relaxed/simple;
	bh=B3n8vA//QM1CIwtxE/fQvsL67043ve4LWUqbQzXHwCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rQ0RVF4LnUdeFh0+ye1UxGUZ9ccyjaNihWTg7nOxtlTrheVYt3QsLq1ukPx6Hcm6fB6/aN+sNWeSXk1vNELEbo2R+rcScygkAEbGGBTlHST/DeMN48WGyBo8pkIQg0iEZ4Vz2AlBpY8vi7NVmtcbCpeRa8NB/aB1FJ4SR1uby8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOSF2NNN; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOSF2NNN"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12dca45c95fso86043c88.3
        for <tools@linux.kernel.org>; Sat, 25 Apr 2026 12:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777146603; x=1777751403; darn=linux.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXN3qo99bZC7QN+fcflaLQleX+sloRrtFplSutWB6kY=;
        b=bOSF2NNNjiSjFVjcEJCaynLToE62B1QKZXjPivHqyXLpBniTg896LJT17CGuchMdCY
         PLG7sPjgYC1RKrftPUonc7IAWaUM1igerH8CEkmLL6EKbGPRUECYPp86kh/99V1FP5na
         hxH2QfK0uUbwU0KrGitxyBbUQUbmA6kdeE45DM3VJA/+L18cw+PiMCgFUIPL5THvL58O
         sBJEtaflWNGASEK6Y1ynZi9LPF3fJdkuResJHnRzG3aULS53PB5rU4BasIjst7YHc9vo
         mHOrw29/p5mmPgxWnE9/qZliykSGNatLczoBgB9+8e5e+xi7HJXSsMg6RwO+S2Qh769S
         cg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146603; x=1777751403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OXN3qo99bZC7QN+fcflaLQleX+sloRrtFplSutWB6kY=;
        b=bpu95ziNubF4jQj0WJSH7wT6Gl7L3x+Bfolc7xZ9cvn02X/3AnjXPgJW6Ng2DV2Rnr
         tzzPrBPcocwKMnBKTsVzhdUiE5v9b6cnbgLOauOUu4ME72HDziTOkORUG9a7KXpx7DLG
         pokY4aPLftkhcwfyB8GQSzhIApAmOlTMjmCQKu8UYJ6TtaBhKnQ5I4IjWlypWrG2/9Mo
         E681f2duS6v2Mr8UCWD4agjOAZRxOGWu01W2FViknl/MOtJY7dPgNodhoZjwF73HXG9C
         qTQCKobiD92jBDk2otU+acixi3EI1GNK/wb3Kon3Gr9xcZLrrtsOR8DUq6faxlKtZdli
         qkQg==
X-Gm-Message-State: AOJu0Yw+o3ZWPBUP64xOc3l00lyiTaai9j8d7ZOWa76sUf0N3j1Fhhec
	8PhWDoXEFPBM3yI/3+csUtNRdpZL8cT2gApdoVz27xEo9cZDh9wmEu2b2fqXCw==
X-Gm-Gg: AeBDietQ/RHT9Dj/55tocEMAaEKzji+tLBHwecmOXFvwXQZOKeXUCaZeIxrwAYX9Wdf
	oVbKvHbGvtcQyvQggne72wbr8tZoawu3z5IBpoStWLt8zTG7t4JOwiWwyhWQ+2P1bN4EJPueM1m
	DZ4Ti1Su9yZ6USGZU1gei8r4G9DZExjiL5NUnnr4daCz/gnOLDSwCzPAt3vLdKZasBCsHUoKkIK
	5/KqMRXw5m7NsjtEZPN2gnPCetUwJRJ7MYez852cLC5XYznJ5U+QuOg2P+Q6rMkfF8O8j75QhDi
	LmELIW+r1H5s5NWp9X6W1egn2s0xZAYQOILDulUcmv7FtUsOJTmR24O7b8GU0me6tKAha2hrjqY
	OB/vobcxy6KVsHjFn2TgqOU9omxE2C3nQ8edpd0pa01q/4xgJjiMKjAb8cnepngtc+45kLtM5O4
	nrkoiEotwqfCP4xVXRzHASLkBmL4Y4s47c4DQVqn00+KI2nnHK1hV1xtl53EYzm3uUI2iUYEnOF
	ewyjFJ8rH/Jc9d7u4vUjwdi
X-Received: by 2002:a05:7022:458d:b0:119:e56b:c3f5 with SMTP id a92af1059eb24-12c73fa1e43mr6591392c88.5.1777146602805;
        Sat, 25 Apr 2026 12:50:02 -0700 (PDT)
Received: from localhost.localdomain (187.250.115.107.dsl.dyn.telnor.net. [187.250.115.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a20eb5sm48512078c88.14.2026.04.25.12.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:50:02 -0700 (PDT)
From: Adrian Neftali Sanchez <lutgaru@gmail.com>
To: tools@linux.kernel.org
Cc: konstantin@linuxfoundation.org,
	Adrian Neftali Sanchez <lutgaru@gmail.com>
Subject: [RFC PATCH 05/13] b4: normalise git-reported absolute paths with os.path.normpath
Date: Sat, 25 Apr 2026 12:49:33 -0700
Message-ID: <20260425194943.1499-6-lutgaru@gmail.com>
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

git rev-parse --git-common-dir emits forward-slash paths on Windows even
though the OS uses backslashes.  Pass the result through
os.path.normpath so all callers receive a path in the native format on
every platform.

Signed-off-by: Adrian Neftali Sanchez <lutgaru@gmail.com>
---
 src/b4/__init__.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index bddf2db..262668f 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -4534,6 +4534,11 @@ def git_get_common_dir(path: Optional[str] = None) -> Optional[str]:
             topdir = git_get_toplevel(path)
             if topdir:
                 result = os.path.normpath(os.path.join(topdir, result))
+        else:
+            # Normalize absolute paths to use the OS-native separator.
+            # On Windows, git outputs forward-slash paths; normpath converts
+            # them to backslashes so all callers see a consistent format.
+            result = os.path.normpath(result)
         return result
     return None
 
-- 
2.45.0.windows.1

