Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664A32DC774
	for <tools@linux.kernel.org>; Thu,  8 Jan 2026 16:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891128; cv=none; b=MkQOxi3WUf0UZNEarn3rrLDFgsQokIDTSZ9yPor0vzRvqCW93XLR4KhfPacWZnbhl3dbD2H611kalI+JNOiYW0d5CivcBA3QeLVwZZj9iYRSsuiWgsWQlgW5cMG76TLdUSi41CoWHlR1T4JjgY4WN62/TWJQoMVbZl+t4e9til4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891128; c=relaxed/simple;
	bh=WcwB+GS/bRtZ6XdaZAdcMU5KDLV9WDDIDs8nzw3zj2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m3rIDvN/mabkae5DQr2ETNC5zdFO+pJSFti4tYdekG5Ya4xNhPBJjrfCzd4ZuvoIyt1n3TQzz5C8w5zCK1obPtoU734vKtuHbXud17y9SRxxXIZZy/+x4+GVXi1PkKYvgx3WdN5frAh3V671HFmD84lN6/GJ45K16tf0YIAJr7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5Y3POv2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5Y3POv2"
Received: by smtp.kernel.org (Postfix)
	id 0BA7BC16AAE; Thu,  8 Jan 2026 16:52:08 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 55D25C116C6
	for <tools@kernel.org>; Thu,  8 Jan 2026 16:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 55D25C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b727f452fffso330096966b.1
        for <tools@kernel.org>; Thu, 08 Jan 2026 08:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767891126; x=1768495926; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Owldt8+JqAX9u6pNxU4XIZvYcUs9xiJo3puRMMlxxQU=;
        b=Y5Y3POv2JDACGJXrraudrDxG04E/sE4IzC5csowkH4dOdN6/LyDk3MKjPQOezY4NBo
         i89sdbQ/++DYjlUUfOK8oEnlGgm+BKcl5i+f7sjZjD16VD2ewQUNehfMpudEsgbeW6jH
         zxi2HQz6loHlct7iqqZIP7VY4oKgDmoEAOW0oSVTo0LwEFaXxksGBxjvpbxsA2YKMiyW
         vKdSMmOSdP2cqNMptwOT5MGhko3L6baY5jnBjmksPThCUv2s9pLtenOJUDkd28ctPKAW
         y6fT8KhgYS6+noOvpc8ycIgmmeovINZbZzzn8Sa8XcjYVXqOcAPCxiZYs+i5MmQoCwiK
         Hqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767891126; x=1768495926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Owldt8+JqAX9u6pNxU4XIZvYcUs9xiJo3puRMMlxxQU=;
        b=mRuuknv9LUBICFb1GP277q5fQ7PCDQFa1fdjCDHbujowMikpMIVOYdFWCw9eAeJPQt
         06i/L4llYtp/EgK/x5KDRiRfgZIGje8UE7+hRXuIbMN6Z+Jpp2lu72FJAsuAoGGZiSd5
         1LNzf0gS3O49xP14yo/mCYXYQEZtMykbV3fGkgk21AUMrVvD/prA6xwtQs7LTJXdmQyY
         pT29khHzPO4YTPa8nhCsEN+J1oNapBPx/iGzXMKS/feSM8KevAYw+O9xmMKyS9btuR8i
         LQgzS3x6Vs4YLWAiNLRfWVH+kma0f1dmgxxBsy9pM/uKfyznzf/BbPAdG0KUrnFnICZe
         92yA==
X-Gm-Message-State: AOJu0YwKMSlJ44vDsQfP5sKf1KMxetVaJGIC5C3I/4zuvh019EqfJ7mW
	mETfE0fMr5fOYu/eRNSSXAcPlVRTdc+S/U4jSCyq3FHuJz+lOZntqoOsDNSBew==
X-Gm-Gg: AY/fxX4jeSiELjQUOyLuTzMUOws2PeX+mHlBvDjqRnPMTcPKwCxVHtIwzrrKq+Cu6M3
	30BmY3/sCoVXLo2J4VdacJVxjdvlbj7EnX7BCYNkh7WYparxXSb5UvLIraR9q1Bo4PQQxAxOSQl
	0pvPxw2+hOP9ug8RonWYIKwisb78XF6+uGiINNTzRjIS1Z5RqJPl2z1V6T6L3gUVIiapLl1tL/z
	SBHW4NaycCKRbNr9KOiVxVgcF/AJdoIUdmgP14YVhr8gpJJ5nSVIE8jBMPRRIhi0N39hJV6mdxF
	vlzzi7+FB8yD7k+j7wcum7VzbvhXj85HzN/YCsVHiCfJQFTGCLovp7xVvYa/aF/GkDw0u4p+6er
	+jqJ/mas6KFRwme7HorCpKpBaPBR/t68owo7iXFVscMSRSGuq8SFGoLWckeRlqR4wprJxsH3eVU
	O5iap6kTFmKrrMoKGKWAQnN5KKWIuyi94K
X-Google-Smtp-Source: AGHT+IECFIsUiR/Ls281o5aITD+2ql/n9sIxiV1bZusW4OMMWVM1d5kwo7RSWdx/vJDZEnMXbNXB2w==
X-Received: by 2002:a17:907:6e9e:b0:b46:57fd:8443 with SMTP id a640c23a62f3a-b8444f8ef0emr701023466b.24.1767891125349;
        Thu, 08 Jan 2026 08:52:05 -0800 (PST)
Received: from tablet.my.domain ([150.254.44.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a27cc6bsm863857066b.23.2026.01.08.08.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 08:52:04 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
To: tools@kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH] Use pre-Python 3.13 Generator type syntax in conftest.py
Date: Thu,  8 Jan 2026 17:52:00 +0100
Message-ID: <20260108165200.11313-1-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Python 3.13 defaults to None for the other fields of the Generator type,
but the version of Generator in older versions does not support such syntax.
Explicitly add the missing fields to allow the tests to run on older Python
versions.

(An alternative solution would be to use typing-extensions for older
versions, though that would require adding another dependency.)

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 tests/conftest.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/conftest.py b/tests/conftest.py
index c5ced78..a9c9157 100644
--- a/tests/conftest.py
+++ b/tests/conftest.py
@@ -20,7 +20,7 @@ This is a test email body.
 """
 
 @pytest.fixture
-def temp_data_dir() -> Generator[str]:
+def temp_data_dir() -> Generator[str, None, None]:
     """Create a temporary data directory structure for patatt."""
     with tempfile.TemporaryDirectory() as tmpdirname:
         # Create directory structure similar to patatt's data dir
-- 
2.52.0

