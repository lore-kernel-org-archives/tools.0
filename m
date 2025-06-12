Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD11B22333D
	for <tools@linux.kernel.org>; Thu, 12 Jun 2025 16:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749745520; cv=none; b=fAejUEXQNVmcUK+goCXM3mlj6rTDcdPmLNf1IT1KXgYqLLovttdLZwJg/oTBNYp+TiR65F2VyTof2LFXxHZXPRWu7g/U7/c/lnpTvYts0a/1bJ8xgYkSpJQCZS/o1aWONdyHEjh83rgDmF0g9tDAP1XvM2YTFmbu5f3tTdO+ApA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749745520; c=relaxed/simple;
	bh=j/vYkljiD+saVkXCU63yrxnWyHhKes6/xI2FfsDN5bo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NlLOu8NW3Pyo79krTuABSLet9kggthB/iRQbEf/6kPEQRskv7tu/6DqkeL58ObU6b7BJwSRJfYGG+VIc6UOM7MAPNA9AkeEiOfalsHgpOeYNIRb4Q+pbaKCdJvmEDcrIZi6SXm9E9Mm4dGMJrGKrfEF823vqskumo5mkh6Cmq2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=To5kqJ8F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="To5kqJ8F"
Received: by smtp.kernel.org (Postfix)
	id 598D7C4CEEE; Thu, 12 Jun 2025 16:25:17 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8115DC4CEEA
	for <tools@kernel.org>; Thu, 12 Jun 2025 16:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8115DC4CEEA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-408d14c7ebeso701442b6e.1
        for <tools@kernel.org>; Thu, 12 Jun 2025 09:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749745516; x=1750350316; darn=kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oxR0yLND4oibnFv6Tkm6/a+BbjftQtCj4iB2mtvBTbY=;
        b=To5kqJ8FCBuw2GM+hs9J3IImHun81vxL5SQcE7TXNL2Xyy+eTd942OLCif6H4nS3Sf
         59URrK+vr+phHAJWUzTcZd5lwAB5ArejpRNLUmMAZf4XyXnZ+gHDvmXKzRIfxI/lyLHK
         aQ2N6CFL52cNe6IVo+3J0WOm+yHuEnzfHPrBrXfIXFDCQLAMatb1CWfXCHpk75hvlNlB
         fvXCx5gyHSW0SFe07WoeM1IfOwGV/LjMaTVxuCoHcvDCPJ08OCN5DsAqk3uiYpEpFPUE
         7dTbNdzG65k8gkEP1gQfrdqjp/Mz1/b4Aod4nsAaAnfqzsG/e8J1HWOAdvLiVhQyVsEV
         UI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749745516; x=1750350316;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oxR0yLND4oibnFv6Tkm6/a+BbjftQtCj4iB2mtvBTbY=;
        b=sn/RW1zahM/AIi3Xiosi4zcCsjovlyQJg66rwjT4XhA8c0rnsajmV0Z2gUo6U0EyBD
         GhsIN6ANtmxRn2EbIPDM4TGNiht1OKXPeKoN7SrC/RkUU+Y59AWrLPyLciUSYxDz13ZU
         Fy+uNfaILouhdXKR4/yZx6+TFUJJHKmVz7bXFfk7Gpebkc66zisraViAcvCKbwFrR+T7
         QYERnlgVLisR/tpMvuaGp4ovcQKX8epwTExKHDYN367+C5oR1jWo8g6yoxXMFTPVYolc
         AmqEzPnTKt/aNhL57XkML1HLh1CmMGu8gcCbFYkravcHJX4cmz7vuvR4ac6domktUtUg
         IfFw==
X-Gm-Message-State: AOJu0YzQGgkiY+ZytzqhPsoKK/yCKPomxPjgY30pyYxnhCQIpxVY/DsG
	wkI/XzyJQfnl6mqS6hrebTq+m/uZ4JzfY80JrfS/IiYOb3HghlRvEok7gFlUNw==
X-Gm-Gg: ASbGncs4wZ6xQ4Dgx7FqPRQs6yuSmGql8TSj1b0TsPI3DKcsELrunvI09tSSwoDvn2W
	Le5xfAEpLMv/Sv7Y94m8JtlfDqQNPTDQg6U2/YoUaPQ0GpmshJWlp8q8avf91yWTwvKG40dvlT5
	AKGakhVprtcLO31f3DMhX2mprDVeK2JKrmpcKeMqBa6OC//7oWlP1JRNu5Syd6hcKYOPu/lscm/
	LC2fZRX6B7s43OQ5Uf8cWt7n+pLDHb5I8ib4D9jjWpPQ/ToGeAMyFNRxIZWYAzyQSVTqWtRphUc
	gnF7lreRgf8L0VC7bhdMOTO5AH1DZnoeIaqOKdAy79Jbmz/sW5ATw3h6GnpHsEWA9Pg=
X-Google-Smtp-Source: AGHT+IGSF4PseQpc1wmJ1+lJL9vPpjmBTMliOmy2kpe5nUWJjsCkDUVHdpr6ammiZRjzqujGmq0Pxw==
X-Received: by 2002:a05:6214:252c:b0:6e4:2dd7:5c88 with SMTP id 6a1803df08f44-6fb2c38cbb6mr133795236d6.38.1749745504509;
        Thu, 12 Jun 2025 09:25:04 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([204.93.149.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35b20f72sm11996486d6.23.2025.06.12.09.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 09:25:04 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH 0/4] Improve SSH signing failure message
Date: Thu, 12 Jun 2025 12:25:00 -0400
Message-Id: <20250612-better-errors-v1-0-3aa1523f6d8e@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFz/SmgC/x3MSwqAIBRG4a3IHSeY0HMr0cDqt+4k4yoRSHtPG
 n6DczJFCCPSqDIJbo4czoK6UrQe7tyheSsma2xjWtPpBSlBNESCRD343lmDzjrXU2kugefn/03
 z+36fWY/KXwAAAA==
X-Change-ID: 20250607-better-errors-9f8a20e72aa8
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Please see individual patches.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Tamir Duberstein (4):
      Improve SSH signing failure message
      Plug subprocess FD leak
      Avoid spuriously reading gitconfig
      Remove impossible assertions

 src/patatt/__init__.py | 63 +++++++++++++++++++++++---------------------------
 1 file changed, 29 insertions(+), 34 deletions(-)
---
base-commit: fdd2e2340ec2757ddf62ec2ec10b980ba4223ec7
change-id: 20250607-better-errors-9f8a20e72aa8

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

