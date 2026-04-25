Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5133016EE
	for <tools@linux.kernel.org>; Sat, 25 Apr 2026 19:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777146606; cv=none; b=SZ5FT1lIL4q0zv3Rexu+KzaJhNnj+TAo9jcmTvPI71IuRtOI/3cEUzwjqPFfkwNO5hlvjNAHf24pKPSVTxLPTlF/Ia6CvOmkGZ9V3ws1/+BhxH2oeQ/pfcNWUlwC9JrrfhBngugvUhzTKYWsWFwDHZEAHlFLYc5gaeSWZNJvJFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777146606; c=relaxed/simple;
	bh=fXcFjMH90EhNbV8aSkf4kI+Opeezd/JFm4SGT1zgfyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CKtseiNoBkC5eCx1JYnuHn44DxpQpj2798fIgOlkvjNB4zorc1R/BsYlXEFfIbKcK4m0JpGodtI9nShPuvkHfuNbVvEH2/H1YLZWfAdSHCATbRXp/Nvrq3RAwwxOPPn74cNvHSlhiJKOjP1vZmU9/5jKKxMfMbMSgvYVPbhGy9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JV+VYd3h; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JV+VYd3h"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12c7288cfb9so207702c88.2
        for <tools@linux.kernel.org>; Sat, 25 Apr 2026 12:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777146604; x=1777751404; darn=linux.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fx+v1rBypPEApm335h0mvfo2aIngbdyZpgsnIrOWsok=;
        b=JV+VYd3hi0BMr5YG9/733E1i4Al7IMjwOepmu5+FRnD/0RuTV6ZtlP3tO7QMVt4xfB
         I5qlZCLLCcZA3+SU6611j0sJhvx09koHKgHvBWH9uPSqaXEMrNsX45xVodBAhSTTNzfo
         NNOZfOHozXr7Ato37+Ivbr2sMoTW4iI3YY8e12nI8Q7lZiNXuH4uiwx6DLTm5o751dj2
         0AZfEBLrPHbFsA6L94Cz+SUSt92xKppfdvPr1Y6a2s0nvc220SZ28qIyQcbg5F9Vi/k8
         z1vwtymmYXQtrd2RrtglIKzR21id05tUJLFmOUbJuWZBPppAy80mDX8ogvpNCEq6hG/f
         CUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146604; x=1777751404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fx+v1rBypPEApm335h0mvfo2aIngbdyZpgsnIrOWsok=;
        b=dLhYzo80a5cuTI43oetaogViIIjZMs7nNqlLbMJYeEuKPiFpK/Hi7IIPHK4fJ0ZMeM
         qD0lzS6h+/ylcUZ6fv5/8namoLoee4CmQed/xi11+ILFGA9UBnw+9YRbzXYEYQZACrjF
         dYzTi/d2FnMymmGAmppfLFBngmJsTETLGZTk/+JO3f1oWkgD0muQ5IBE57MdRTyZ7sTH
         x35cs2WOIK6/uyjDbE56vgEG9wqyhJUqI+MquaTicHqs/5u8mtpbrJ6S7Ah2vDVxl7jH
         HFmuA/7UqrLNmxi+t18GBLcDcO/qf1XMBa9ODFjpD5fwPmf66302+Hs8Pmx0KR6hD0yS
         Wu2w==
X-Gm-Message-State: AOJu0Yy2P1CdCuEt6A+dW0vanP4KNNfzcozPJhoL1gWzyZ26RGq7ltsW
	ylbfbeDCDap5zlDR0CYTvjhCkKVaUycY4ILtOUWS155XR8A56PatqocMYn5+Dg==
X-Gm-Gg: AeBDiev9Xi/MEZxnogzc1aJisZgyzKMRGoH/wHg7FD76qQKbHTUGSRpqebELSVp2EXP
	T/oDNQ4edvFiqtg4dJgbyZ4PvD9x+f1CtoSzuDh1WDRQYq6aXpdC6EPS10HSmpifqcFzLZzH2lf
	6smXxXoiBisqahDspzn6WIgfNwM78u4r576P1yyxw+EYAXrdtSPsR0MtfviGiDNJIcWGOJGWnJE
	oUWlp9Txy+MS9y8kR+2OvXBVcZaD2aUAyIR3Lvb5nrnSYK1IghGbaXVtMruUnJeUU2EF56uBiks
	dPpkZi3GkXc4Ypwsr+/JHid6Uq1MsxZBkk0f7ybdRIiNkq8xLgG7gJUCgoEMScEkXqPQSs3A37s
	aPqcFWOZYh1C/lS1RZB1v9BbCj23/uRJnQTB2CGrDv+HuaS8lyH+f1UY+NjEorx1AKdEG+kVsOo
	fe2qF8ONc73fp2nGvzRI/XbrEMYoF4eSksVW3u8nU/oyewFSMQtKqm6wW6FhbxawmpnSKXkKAzY
	q7MuBa/tqGgAxiwMROhGKZs
X-Received: by 2002:a05:7022:2527:b0:12c:897a:5219 with SMTP id a92af1059eb24-12c897a58a8mr5977790c88.5.1777146604436;
        Sat, 25 Apr 2026 12:50:04 -0700 (PDT)
Received: from localhost.localdomain (187.250.115.107.dsl.dyn.telnor.net. [187.250.115.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a20eb5sm48512078c88.14.2026.04.25.12.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:50:04 -0700 (PDT)
From: Adrian Neftali Sanchez <lutgaru@gmail.com>
To: tools@linux.kernel.org
Cc: konstantin@linuxfoundation.org,
	Adrian Neftali Sanchez <lutgaru@gmail.com>
Subject: [RFC PATCH 07/13] ez: use portable uid/gid accessors in write_to_tar
Date: Sat, 25 Apr 2026 12:49:35 -0700
Message-ID: <20260425194943.1499-8-lutgaru@gmail.com>
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

os.getuid and os.getgid are POSIX-only; calling them directly raises
AttributeError on Windows.  Use getattr with a lambda returning 0 so tar
entries are created with a harmless numeric uid/gid on platforms that do
not have POSIX user identifiers.

Signed-off-by: Adrian Neftali Sanchez <lutgaru@gmail.com>
---
 src/b4/ez.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index 3e81138..51fbdc9 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -2800,8 +2800,8 @@ def write_to_tar(
 ) -> None:
     tifo = tarfile.TarInfo(name)
     tuser = os.environ.get('USERNAME', 'user')
-    tuid = os.getuid()
-    tgid = os.getgid()
+    tuid = getattr(os, 'getuid', lambda: 0)()
+    tgid = getattr(os, 'getgid', lambda: 0)()
     tifo.uid = tuid
     tifo.gid = tgid
     tifo.uname = tuser
-- 
2.45.0.windows.1

