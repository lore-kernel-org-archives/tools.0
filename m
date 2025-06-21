Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4790C21D3CD
	for <tools@linux.kernel.org>; Sat, 21 Jun 2025 16:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750522064; cv=none; b=KjxklwDLPxAEf70o4UhQx0ECAs2KuLEvvPHiKRLz8TVd/ixW8NqeQeRvwvj9xQHkmHZefnTo42FtmIvWEeI1mgQcQgZX8DeBA94qJCFtJTsl7X4vuNpdlGDVVe31RTK8/a5OPmluOhLNjBWaCdhFD0JRwlV70KFoyRq0rFKrvRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750522064; c=relaxed/simple;
	bh=i/e9CZ3N6IQFp+r/Enb29mQxFHJyBxeS0XiE/ILRGJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dRJC+PvRc+gewdBD90tE3UuHoAIy4PU/00cbqBl/XSg13iEDWP1ypLoycIDZ/e+n2GL5xnBTcxcfCvA0ICmARzPiLbVYEYQ/xIApvrfCOdcHQekrmYJ2RkL+s+qvHsJTyGN6CdcLukksGTo4DlhpxHaDpoWgiCNPF39TazAisL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id DE518C4CEEF; Sat, 21 Jun 2025 16:07:43 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 13C15C4CEE7
	for <tools@kernel.org>; Sat, 21 Jun 2025 16:07:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 13C15C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=ldv.ar
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-236470b2dceso29940485ad.0
        for <tools@kernel.org>; Sat, 21 Jun 2025 09:07:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750522062; x=1751126862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJsCd1JlZ/yKtONHn5g4V/HbparFaY8VMNGzsPUnYFo=;
        b=w/Cxq3HAmJksC8+HYmMK/XEYCctdEaaBhRAvp+8RwthPxf/KpdbuGRnJX94mlhg9qK
         u3FZRf4+nYduVW9oGnRkl8OIHZ/eJDUr2zU67wbRfz6MLQE+g1Bb/Qv6QEpoHJHsU0jD
         B+mG3CXqpv90Crkp2+d5GdqSnw2POD4OzCZtNcfY8/pYigknIa6tcZEPtjyNDbYZR+IH
         GAWFvEBvCD9wxKINKEYakL3dmPEH7NbgzJLQ7e3rO6I3xhQJDRB9BbCO5l/oQG99GyOI
         LoYvh6e8IpSNT0aN0j31YxohHtOSn/6yLTdc2ynsqvdGWFRpy2sP0JjPLjHcG8Lp+o40
         Jofw==
X-Gm-Message-State: AOJu0Yyh1OzAp9SoUcSXBG0ECyWBel43TUUBraCbiTrcj2abGoQP/tMS
	Ge0YaHFwjpMtS/eT+pk/SEdJvj/j1Fa+KCiBlHCoOBAvycvl6SwTuMDS5/2SmA==
X-Gm-Gg: ASbGncuojizeDgVVFlTKx2D2Xbfyp97aldRcJJH1nh0PtAewk4Pc3T608QzJ0ke6whf
	TZFKnkO7B1CUUsHo3HpQ3Tt1iCIylSAISiKyeCq/1qguXvg5lDnQnP7RBSgQC4DRukS91fF1PIN
	5g7rabyRiVbXBFp6egsyxi7NnyFl9oZGst7FTrbORcndCQeYSZbqrwy9GiZf+xMjU7qIwbuL57z
	P0NBvLQTxZxUKwDrhmdxM88gJSN5/jJQh8AMihmxUYk+FepNIF5XZ2Xu/TRtgyMRzo3ZvninTZ1
	BAI89kQbAAP2ObLsnniZ7VSuHKRnrfuYHriVjaXd399Qm6ThVoiZAApmRHEqqD2GYHJ2w4DL1OK
	Z+H2/w07TCU75Nw==
X-Google-Smtp-Source: AGHT+IHzbegEClplEjAlTz17viaYsim7zQvK1rGRiuAerFyihPHYU0VW0IVPfFB3SfJke4l4H8PPbg==
X-Received: by 2002:a17:903:1a83:b0:231:c9bb:60fd with SMTP id d9443c01a7336-237d9a74a5amr109234905ad.33.1750522062032;
        Sat, 21 Jun 2025 09:07:42 -0700 (PDT)
Received: from pieman.localdomain (host107.181-2-57.telecom.net.ar. [181.2.57.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8609968sm43917915ad.136.2025.06.21.09.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 09:07:41 -0700 (PDT)
From: Lucas da Vila <dev@ldv.ar>
To: tools@kernel.org
Cc: konstantin@linuxfoundation.org,
	dev@ldv.ar
Subject: [PATCH b4] docs: Corrects minimal typo
Date: Sat, 21 Jun 2025 13:07:32 -0300
Message-ID: <20250621160732.1066586-1-dev@ldv.ar>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Lucas da Vila <dev@ldv.ar>
---
 docs/maintainer/am-shazam.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/maintainer/am-shazam.rst b/docs/maintainer/am-shazam.rst
index c243027a7975..b6917064a485 100644
--- a/docs/maintainer/am-shazam.rst
+++ b/docs/maintainer/am-shazam.rst
@@ -43,7 +43,7 @@ The two commands are similar -- the main distinction is that ``b4 am``
 prepares the patch series so you can ``git am`` the resulting mbox file,
 but it doesn't make any actual modifications to your current branch.
 
-The ``b4 shazam`` command dos the same as ``b4 am`` *and* actually
+The ``b4 shazam`` command does the same as ``b4 am`` *and* actually
 applies the patch series to the current branch (if it's possible to do
 so cleanly).
 
-- 
2.47.2

