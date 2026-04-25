Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618B52F90C5
	for <tools@linux.kernel.org>; Sat, 25 Apr 2026 19:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777146609; cv=none; b=H8zMXOgwfMXFuQ3aSraEPeIkNZOmAMSAchL3mwup81JsEkQpcMYaaWq1kezNl496DpMfl7ctwPB4TJh9d/SzbRQvLyBnWPCpCqavNdEIG8CpfLyfljueK5godHzN81aIF1GuV8+3bszUrR/6yHSUoI8B89wvsVFt+KtqOyJdheI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777146609; c=relaxed/simple;
	bh=+xedX7G4Tq7hmqSd+oeCvQ+hirkzBcR/PGirk91Yr00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iy7dFQT+HBCejC7fXck0iqmPESe7Kg1BbeH59y90iPkx7vG9mF/di+CQYuZlgGcojfqblAeRjPVzVVSTWF11cd97YkzLWHMjmNFgcVxZbE2PmDiBfbo6OB6CqAJnLtF/+vNKXChsZ8etmZPtvX1ReEB6UUbn09f0EKI5zbBamVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbkcumiF; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbkcumiF"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12c1161232dso575183c88.1
        for <tools@linux.kernel.org>; Sat, 25 Apr 2026 12:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777146607; x=1777751407; darn=linux.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIbsZ+iFOHTsSyYiy3h7QBv8E6zBlu7JQxk5Cikh9Q4=;
        b=MbkcumiF0nu6UavFUbuxVs7va59B7K+LNlcwsojRTB4gcY32xZgVIyepGt/SbXrOOY
         +oHqAmXCYtefqzDHpJW3GpshF+kJHmaLBecw3hUja1f9jtefISOVofKZmfzYCYwOzYCY
         YsFMLp31pNi8LMQ9DzFq2xJZfVV2vGbc07YHYLapPpnqM8luNKC1lWNQf4aehVwPH0C1
         BD5duF+bU1YGNXD6WxtkilWDXrMqgi3F8Ya2vaZUR4IRwKVnJdB8G/JFJSusbTRrKB21
         nW/v0IHsWCUqXlhvIKQuvNrKCzJEL9SJ59h3dtJ0QeAh/aq/wZr/po2WiIdzsAM9LDKp
         XNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146607; x=1777751407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CIbsZ+iFOHTsSyYiy3h7QBv8E6zBlu7JQxk5Cikh9Q4=;
        b=VR6EWY0KFhIoT3UaEyXfKgJtXyMI41DJSyRVD8G5h/fhUlwQIYdiNnKP+MdTVPSOyF
         xHXMdMdwwTDnN0I/N3zsMm60R6og9wnG4pX0myCbiJIMLaDBDG3ukumVg9SEVb3G3QX7
         AXb7KHOCB2CTw1Dy6RJK7+WBEdDBUsTDBph5ajv3DIWZXMSRiG9rQyL2ZtaacqiGQO0g
         6yhG2Pb5obSUvoGWHSQ0h8v9jkp4CF6sH1D+YGa5Vou9QbV9RA7eCfPi+ie40Jr0zO3y
         GQr+twmqG9UBGj6XSALRm+lQgLNr5U9BAHQzPQuDjiYHpnxPACXHM1ujVdISQRkvDqnu
         dexg==
X-Gm-Message-State: AOJu0Yx2s+9ial8gi8lbAInwjoILS8ZDCVUZ7dECY9c/a4482Gu628kc
	Hx7aBc+J7JpDe70Ha1jMEeeXzvjL9ho+YnEakM3dEfbqIs5EPcbs6sBJV/hj1A==
X-Gm-Gg: AeBDieufDkkurOw9Sfnn0ay6UG52SBWszr94eMWcOQ8pA0V5IhkopiP2LWt5BRxr2nu
	7CFps4VKC6HY6BT9KuU0pUXkPLb7hLWUzP7x0rjeyEo5Dld+hnVpMlEWlnvFilbAzLAnx2myOO/
	qGVg3KJ6bo5jT0md6Gk9AfbD3/rXexwC8RS8tOAJkVOd8+lF9/LFbU8BYogwPQdKejhWWkzDD/y
	1kDz35Dh1KoYoptuj+xJDDjZWDrNFDJnX+eNGm31wBydMwi2gE7jbiPic3CrDLgTMfbRDVB+rP/
	iQFk6pfLouCON/oaWspk1UkD05MpJinCRg2oRu73jSIjcW/EnAkkfY3aRJr8UTcEscNfjHue/DU
	JDup+DnXGinTLQviIY89CG4FrbrWdp1lNlJxyFVxSbi482Jilsk7FgFQir4Q0mshMG6VktubRpb
	NALqN6g0ozCOIzudqMzWuSKB2SaXtPmc340KzEpBYvLBLefWK4n0Bg3qX4D+VqaaZPnDEyECv9e
	PDpDQFO5L8Q95kPkcW06uMW
X-Received: by 2002:a05:7022:6085:b0:12d:b4e2:f566 with SMTP id a92af1059eb24-12db4e2f66cmr4561181c88.4.1777146607222;
        Sat, 25 Apr 2026 12:50:07 -0700 (PDT)
Received: from localhost.localdomain (187.250.115.107.dsl.dyn.telnor.net. [187.250.115.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a20eb5sm48512078c88.14.2026.04.25.12.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:50:06 -0700 (PDT)
From: Adrian Neftali Sanchez <lutgaru@gmail.com>
To: tools@linux.kernel.org
Cc: konstantin@linuxfoundation.org,
	Adrian Neftali Sanchez <lutgaru@gmail.com>
Subject: [RFC PATCH 10/13] pyproject: add Windows operating-system classifier
Date: Sat, 25 Apr 2026 12:49:38 -0700
Message-ID: <20260425194943.1499-11-lutgaru@gmail.com>
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

Declare that b4 supports Windows by adding the
"Operating System :: Microsoft :: Windows" trove classifier.

Signed-off-by: Adrian Neftali Sanchez <lutgaru@gmail.com>
---
 pyproject.toml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/pyproject.toml b/pyproject.toml
index 96e2fa5..2522930 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -16,6 +16,7 @@ requires-python = ">=3.11"
 classifiers = [
     "Environment :: Console",
     "Operating System :: POSIX :: Linux",
+    "Operating System :: Microsoft :: Windows",
     "Intended Audience :: Developers",
     "License :: OSI Approved :: GNU General Public License v2 or later (GPLv2+)",
     "Topic :: Communications :: Email",
-- 
2.45.0.windows.1

