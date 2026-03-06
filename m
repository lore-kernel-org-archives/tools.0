Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9443AE1B7
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 16:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772814035; cv=none; b=XZqqMDi5aOEaIQZCOCImZwpOZbZw/TNGVW4jzDrmRZ44x/3N00NhyQRTNPEaov7VB8IpzMxq1hbDVy7fRnnVB3QqjHsrlee4ik6RTWUibSaN20fMY8kT78MqC4Er0ZR3nQPNkDhRvfOvJHAPl57GHrtO3HzQOulvaBoofCVrpjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772814035; c=relaxed/simple;
	bh=raDgG5dpXbNLkEQaYY4H/HQw9ue85D6SZYRk30sdlZg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bg0kuKQ7mOxtsYXvFof1v6LsTHmSwnY5dpI93WYpnEdoHrerSZxgcwjw4THvUHMhFdO1Sx+kbgdWev+8RWRY7qf1NJmyLsSZ0slW4UzSXv5uPApVyl+okZK1KAYLsIf6paUmc21UYLGYqf2FVEY4uNdU/bm2jOyBcJKVofVuVH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0sK/2YJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0sK/2YJ"
Received: by smtp.kernel.org (Postfix)
	id 2DB3CC2BC87; Fri,  6 Mar 2026 16:20:35 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 66D77C4CEF7
	for <tools@kernel.org>; Fri,  6 Mar 2026 16:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 66D77C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2be4781d2baso736747eec.0
        for <tools@kernel.org>; Fri, 06 Mar 2026 08:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772814033; x=1773418833; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rl5Bib8m74m5+dumkR9SJjghRTIYmjOyKGDkysKaSiA=;
        b=I0sK/2YJCt5kTE/JIlRZGPZN4VE/FOptbKKJ+wCEb/K1KG6aunrEW7ZyPieNx+Hca9
         NAB1rxSxgUlOT3RYkMU9prs/uDAMUvuRPxDMoi8DQ7ygQHygp2GRMr1Q9YGIzddw5Wmy
         TV9hqmNI9l+lsmnwgGhqCsR+QaYydrssTLwGlM5v7vPpv0V9yzCn9a/lPgF189yHiQN9
         PDhCZbTIO30CdvGgA9zdPLBxMbYeG28ZqA5zOnJuOuOAMGR6gYEbq8M7ck65CPFIoDoT
         dkirCo50+/0snF+S8LpbYiqj5Culp9k9/GEiDyhmy5Uf0/AxiGHuDP8Eeg83o9lCishb
         PT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772814033; x=1773418833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rl5Bib8m74m5+dumkR9SJjghRTIYmjOyKGDkysKaSiA=;
        b=LrSzBB1vGGKoMM9evRl/gOsP5VsbeSTPiHVhfcX9AxM1OI4uY0J+RidponN75cAesw
         BXBVMAHcaYzmmSCPlgfJmPpfHHcEri/GcQbAieCyBWlUJzwVUmP2+LHJpsfbdBgw/8iK
         GUN2UyvIlgm/QVRiLBpyv4UWy4s/JAOR7GiVYSqoDNAQroRYFqitilsCiNx8d6FIB8Oc
         2ZaN+V4DaN1nM3M37nIJWS1lOJhm2K3esp3J5F9jLATRmr5HG5KMGcc3VwVwqrLoQ3Ha
         Nx+3kK/kQXeMkkYXJZeOfTJYs/2rQwvrQag8JIVnsP1Oe3NbDtnebwKmqTlCRspxC0Wj
         jcCg==
X-Gm-Message-State: AOJu0YxyUIk3tHAgB78GL36kFfiG8aGb7+YKzhH28qLgKvoENt4bI3I0
	5rxMBg3acB6pdR6Xp9Bu9kUb9/aqEENE32psjB8o8KVwzePMABx+24HM9Wsa6A==
X-Gm-Gg: ATEYQzzGSstlYS9FO4DsOTGzq92iZ3eZPw3MussFdZngDZLvVsy+cdYPPWO8uYIzZUj
	iZnoIxHLjh6ce4LWg7H8gNRID/u898o+CUOizYydvvZky/ntsrp5e6REAsJ7mdrPfsXDRCH0TyT
	fidV9tHb6xCjsLeNtoiqr4Mn2nNmiiSwlQiqE8nMCujV2SoY8t5/DNVaDNg9wY+r4xMhJYGU3Ud
	VxCzFqgj316xBy8AjhUf/FgXLFddthhj2aM6dpbgyGMljCMGW5mnRfRmUC8d4qm+OAgcqGdgir1
	ilBfXV/GS/lwaoz8odzJufmm79U7UoSBZYt14SggUMNnQwxOCxa0UsWKigkxKecYMaoDnMYlw3r
	EdXmuuxMNT413ir9xIhXHqi4tBefYdKmY0ehWOEwSJCEXKejRz36mIP2xq9F9G4FBfKgrkZ2RIt
	HiGPzSjYlksN0PA/gXY+RzumsfszeLMooMsqZTdekQDpg1msSQ70XKNfLGUts0aHY03kPE9U2Eg
	yfcMgxWSzP1IBY=
X-Received: by 2002:a05:7300:3b06:b0:2be:37d:3d6d with SMTP id 5a478bee46e88-2be4e0ac5bemr1099939eec.32.1772814032967;
        Fri, 06 Mar 2026 08:20:32 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:1554:a973:4eed:d1b1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f948411sm1411678eec.21.2026.03.06.08.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:20:32 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
X-Google-Original-From: Dmitry Torokhov <dtor@chromium.org>
To: tools@kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] b4: allow using xoauth2/bearer token to authenticate to SMTP servers
Date: Fri,  6 Mar 2026 08:20:18 -0800
Message-ID: <20260306162020.54683-1-dtor@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow using XOAUTH2 as an authentication protocol and assume that when
XOAUTH2 is specified the password is actually a bearer token (typically
not stored in the config but rather returned via "git credentials".

Recognize "oauth", "oauth2" as aliases for "xoauth2".

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 src/b4/__init__.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index eab290b..9a5d25b 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -4312,8 +4312,8 @@ def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL
 
         # If we got to this point, we should do authentication,
         # unless smtpauth is set to a special "none" value
-        smtpauth = str(sconfig.get('smtpauth', ''))
-        if smtpauth.lower() == 'none':
+        smtpauth = str(sconfig.get('smtpauth', '')).lower()
+        if smtpauth == 'none':
             return smtp, fromaddr
 
         auser = str(sconfig.get('smtpuser', ''))
@@ -4331,7 +4331,11 @@ def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL
                 raise smtplib.SMTPException('No password specified for connecting to %s', server)
         if auser and apass:
             # Let any exceptions bubble up
-            smtp.login(auser, apass)
+            if smtpauth in ('oauth', 'oauth2', 'xoauth2'):
+                auth_str = f'user={auser}\x01auth=Bearer {apass}\x01\x01'
+                smtp.auth('XOAUTH2', lambda: auth_str)
+            else:
+                smtp.login(auser, apass)
     else:
         # We assume you know what you're doing if you don't need encryption
         smtp = smtplib.SMTP(server, port)
-- 
2.53.0.473.g4a7958ca14-goog

