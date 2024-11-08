Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3551E47DD
	for <tools@linux.kernel.org>; Fri,  8 Nov 2024 12:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731069148; cv=none; b=TUvi8uB1EkDIIA/6Wv4ARvvRQsW/klRakIkPM6hPmfSH24DcaRpgNfrRACIvqF6XTTECsAJgEB9FA8JMeW6E+u1E+ARCPKBTej1dRKrt2Csdog/O5XJn++678i1GotOFI+US5F2+q/PyPviCcf8XEfYFwp9OfKKkZ6xPVl/Q7N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731069148; c=relaxed/simple;
	bh=TiOmfjWkD9eZWure12ije876wWJquasB4D9SrLpkFJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SgPeDn9LIShQEePSE2ebHHU8Snp+3ow5s11GsNT4vKIDImDuk+rubFUAXmB92dlVYbI/ETadlBFOy2+qPpLCLJtqdr/QsoLEy+YhTrsecXhjFr5xWdmAoG4MrDqu0qnahxcdKqvTeLlbDtVIaRib8zHgbZDl4wup9ulFaQgJW/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYLEe3E9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYLEe3E9"
Received: by smtp.kernel.org (Postfix)
	id E0AAAC4CECD; Fri,  8 Nov 2024 12:32:25 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D05F2C4CED2
	for <tools@kernel.org>; Fri,  8 Nov 2024 12:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D05F2C4CED2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6cbd550b648so13334686d6.0
        for <tools@kernel.org>; Fri, 08 Nov 2024 04:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731069144; x=1731673944; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/XeZdsSRz+OxEf9GE2OFP7ZbIH3O55iQETRJ/i/gpc=;
        b=OYLEe3E9t2AeHtwJBivSApz80QIQs1L8wd/bUEggGE2Bl1yZL4efcXkMSBMfGnujQ4
         Tie03bcK9p6b3vpFFkUnCg1Kcqhqfg+dlRlVL90jgDJi+sf8CXo6Qajvh2hGp/yOWRhZ
         IA+/5X7QG8cKwstzConGDrwQwZRQaRoCppPBeXs0cLvbAyGCtQEKPeYBvieruba3M3/S
         aFxaAzYzB2DJn0fPfl8FFCJa2AZcPzU+gy+e3EAhjWobLQx0ACZ3O59vfDoQUQHM9t92
         xYFBSfIojtY7hNrUJoh9APuk+mPWJv2PBSEV+VUM/4OB+k3aSPH6N7Fjr0Y0J5cv9LgC
         K3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731069144; x=1731673944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/XeZdsSRz+OxEf9GE2OFP7ZbIH3O55iQETRJ/i/gpc=;
        b=VEqwVpjr0pLX8Yo6jzhq99DfoIWPXYC7rRuIol+E44TF3EqeQQxEFAYl9OTajJyXja
         Zd7QRBhZUM+qHlfECcOvGXl7AeQ2YHeLDfEW03HJgNVUDXqR/m1g8QkGdHVjx8As/2AY
         T2K1dEfDPQnZvFNdM8Nmoa0Rd8gw93JS9IbJQsaPTO32XNXvMlGBtDXUFK6iELfM8Ibb
         iPCO9MXWlvpG1Xsyflaxj4bfilPmK6O6/sRVqi32hHHttoU7ezvWKfMZ/BpwCIPHAYd8
         Q4A3t5GMuCEO89uKozGmgA+ORF4JE44V7wDjBOhX3qLq16GGl8JRMZhaDxKct9errh0Z
         3eww==
X-Gm-Message-State: AOJu0YzhjmstcoVZh0GS3dB0F2x61YsfyW+OzK52dCv+3Espudk06ayB
	VxsoR9ll1GKSt85wHevdVUwS/g4oUNBnb/vb1EJ4zq0AdteVAAK5SuN+9Vf1
X-Google-Smtp-Source: AGHT+IHVxa/p7XMNWkpfCEqrU3STpZ9Q156j3b+Q21YNTVCvX/bNtx/pkFyw702IP/f6CPsk5Ywddg==
X-Received: by 2002:a05:6214:3207:b0:6cb:faee:76d7 with SMTP id 6a1803df08f44-6d39e12afeamr29697076d6.18.1731069143731;
        Fri, 08 Nov 2024 04:32:23 -0800 (PST)
Received: from 159.1.168.192.in-addr.arpa ([2600:4041:5be7:7c00:348d:4cbf:ba75:f557])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3961ef48csm18633436d6.35.2024.11.08.04.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 04:32:23 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 08 Nov 2024 07:31:28 -0500
Subject: [PATCH RESEND b4 1/5] Add development dependencies
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-better-type-annotations-v1-1-ebaf0129d9e1@gmail.com>
References: <20241108-better-type-annotations-v1-0-ebaf0129d9e1@gmail.com>
In-Reply-To: <20241108-better-type-annotations-v1-0-ebaf0129d9e1@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 pyproject.toml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/pyproject.toml b/pyproject.toml
index 31bfe3033650b2b251fcdcbab0456f4a67e914df..7c65c30efdb95fa40cc1f22933bcd62073db4f26 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -22,7 +22,13 @@ classifiers = [
     "Topic :: Software Development",
     "Topic :: Utilities",
 ]
-dynamic = ["dependencies", "optional-dependencies"]
+dynamic = ["dependencies"]
+
+[project.optional-dependencies]
+dev = [
+    "pytest",
+    "types-requests",
+]
 
 [tool.setuptools.dynamic]
 dependencies = { file = ["requirements.in"] }

-- 
2.47.0

