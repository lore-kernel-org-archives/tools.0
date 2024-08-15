Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9731714D0
	for <tools@linux.kernel.org>; Thu, 15 Aug 2024 13:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723729009; cv=none; b=Lw8EUWDrjOEECi4UTdQfeG8wsrahGx/TgqqWdTov9ZgJeODmloYlqwZYmwWtFnyu9JzZvNBx/v/+T3WR2Mra2XAd1Is2cbAzTYvINMPlq79ojos9StMfy+G/H+QYhcPAc2r/erojVZRBTzRdiec1DiEycin95FN0mXr4XuI1yF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723729009; c=relaxed/simple;
	bh=5o01xvHWaKD1agXdUCJqG1GFwS9T408uV7EYdjLQSRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M99rysC4IaZqxEUl4VImntsfQEl3B52180NG3daMmDEQ+Qcl8juwkJIxJLnbUQZHCZCi59Eup/yfJuAdL+4nqm6UvQfrcYVAYqI80noWVLWqmJ2wrF0xz8GnYH9lsNuNPAAr0uJwjJC772j/zFFkunrSUSUWsCBepmyPJTPmOjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yY9NbLNQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yY9NbLNQ"
Received: by smtp.kernel.org (Postfix)
	id 7CB3EC4AF10; Thu, 15 Aug 2024 13:36:49 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 64247C32786
	for <tools@kernel.org>; Thu, 15 Aug 2024 13:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 64247C32786
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-367963ea053so619693f8f.2
        for <tools@kernel.org>; Thu, 15 Aug 2024 06:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723729007; x=1724333807; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jSCZhA4P4fzEV3efZaemljenw1KqzkvaTobT9O67mU4=;
        b=yY9NbLNQlhPAAlpFJa6F+tDlVcQ9x6NtZwy6EUkGwc3xNSzWgYXBFlWhaPigWVRaFt
         AERL8zoZaPohz0MTBpLcVg3gypF/YV8nL253xApw1NFOj2f1g109VE0Lz4ksNOQcPEnb
         kqPsUNU/Y4JT2Vsj7gryMY42NhUpjodCuf0UXgBbNrNzAZFMqK1FvaeiCQb13NsmpMRa
         /H22jJfjh/CUJk2DUmzIB4iCFBviPMD7QaDzn8Kap18R522l+99QKpgs9mqL3H0WIC4m
         wlvNdNur6TSckI0rK/xPDaKsqsN/AajoE793ONL0QOrW4uZZeBioByTEpAALj5aQ1PwA
         ybZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723729007; x=1724333807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jSCZhA4P4fzEV3efZaemljenw1KqzkvaTobT9O67mU4=;
        b=Pt+7Co9Zan2qSKQFJHjweCB+5fnWm4WhRgG5srxrqWCMRAdW+WQpLL4/LmHYu1FZmI
         IGI7FBb0u7FD/yPZehkhcNG3rdMZ1Eoq+PwPC4F8HhKDMffDOC+mQCA+1Vim63MeeiuR
         1QS6HUGCX0JYB6HjtI75jYD95MclLfL6DszJlCm6RPY9THSY5NZow7+qesfVCn/PwInZ
         qumIQN+m23dK41A+QvQIEW/hsD8ZPpQtCZ+Fad5VK0fGb1F7vEPZsXDHivDhX0pVHxfz
         G8INNl6M1Jq5NxepXm2CjLLx05jq3OQgzsS/hXFsMp1YmDI1Ml1KNeissOsavrCczO/8
         NB4w==
X-Gm-Message-State: AOJu0YwM1NF3qpHQXmdLE702ly+wHpTdJGEvqHHq7dTEBW0LodG3Wo1Q
	GLu52IYyylRPE1NFHCCqw6FBzBqYeqlgr/18U2+26isKWDMeOSMS37k9KWe9wok=
X-Google-Smtp-Source: AGHT+IEKMaS7bf6QJxBa5lwdE63PM/6iknaUTu0r5EmhcjF7nlh1v90TTHFdofQ3yBCHGbCUu6hJvg==
X-Received: by 2002:adf:fd08:0:b0:368:6f64:307c with SMTP id ffacd0b85a97d-3717775ddeemr5872053f8f.15.1723729006631;
        Thu, 15 Aug 2024 06:36:46 -0700 (PDT)
Received: from [127.0.1.1] (adsl-122.37.6.3.tellas.gr. [37.6.3.122])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a838396d375sm102979966b.221.2024.08.15.06.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 06:36:46 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 15 Aug 2024 16:36:29 +0300
Subject: [PATCH b4 3/3] Differentiate between checkcmd error and checkmd
 patch fail
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240815-extend-checkpatch-v1-3-ab7f654be699@linaro.org>
References: <20240815-extend-checkpatch-v1-0-ab7f654be699@linaro.org>
In-Reply-To: <20240815-extend-checkpatch-v1-0-ab7f654be699@linaro.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.15-dev-49d31
X-Developer-Signature: v=1; a=openpgp-sha256; l=1929;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=5o01xvHWaKD1agXdUCJqG1GFwS9T408uV7EYdjLQSRg=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm12Z1JxQjVHMzdFaWh4VmY4dFdWTlBHT3pVRUhnCjIwQ3ZsUWQ1alJGaHA4YjJJ
 M21KQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKWnI0RWFnQUt
 DUkIzS2Nkd2YzNEowRS9oRC85aC9INUEwbTU4cWtMNGx2UklVNkdvcWxKTWJOM1YvTlJHYURJMQ
 pNWFM2aU0xc3NVdDd2eHZRdVB2eG5qb0JzQWtiUVVnR3J0RnJvTjBjdFhqUTl4akVPYWI1Rm0xW
 DZLSU1BTVNUCkI2M1M3ajJVd0tvc3dDWWpWaUJzQ0VjSlUwRGRnclVHREYvblcvcmZEQXJrMU9H
 bmxZZ0pHUURlWmI3dWo1T0QKQmwwbTMzU1lyTFFaN0YrY2hvMURNRERDejl5Q3ZiTis2ekhlVGV
 4ZmxQTnVNck1xeTNzb2s5N1Niekd5UUtjbApMWno4TnQrSGJicW12d0VaVVdVd2NqOWhKZkZmZE
 9GZTlIWGMrMVhTRVJDaU9xNnZvOUpjUDJ4UisrMENOMTQ0Ck04U2lNK1o5WXRUQkYwczVGRkloQ
 1EwOUk4ME14bWU2ZlRaUHpScEhlRmI5WWVka0pQSnFJb2FjdnhsL0c4OGcKWHVxS252RUt0MVdB
 WHgxemp5YTNvVkx5dFJjYUdDWitKNWl5ZENVUmROcU8veUhtaDZoSXVnTXVXbU9yYjV1VQptaVd
 TeFpkMjBoazU1SmdCVWVnazZVZVZzeDY1UElGSzczWnhKWDEwQWs5QjJXcEUyN1ZqTkpTYXpJU0
 x4UWhFCnhON0JPL0NkREI2Z3d0RWRaVE5mRDhlVWsrb1BIaVIwYVhwQWFtUUxiYjJkeTc0N3BjR
 EEwN3RpQ3BMTEhzc0wKL1ZnUjc3VENjMTZ5d0xnd0lOaWFzWGQ1Uml5Mmx0emMzR0hTWnlMaFJS
 MmVqcFQrVDdDQkJ0NDczb3JlbjBocwpFM3Jyd2R4ZjZNekZvKytIRkh2MW5FeTZBcWg4eVZ6a25
 wZ3VUSkN2T1plUE12eHEwZTJtaGMxR3Z5MGYzQU1wCnFhZHh3UT09Cj1sNVlzCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1

If the check command fails for a non-patch related reason, if for
example the b4 config includes a wrong flag for the checkpatch command
or has an invalid command in general, it is not possible to disambiguate
whether the failure is with the patch or with the checkpatch invocation
instead.

This commit checks the stderr output of the check command, and prints it
if it's not empty. Furthermore, it does not cache the output since the
check was never essentially performed.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 src/b4/__init__.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 2b1a058..2da375c 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -1522,8 +1522,13 @@ class LoreMessage:
         ecode, out, err = _run_command(cmdargs, stdin=bdata, rundir=topdir)
         out = out.strip()
         out_lines = out.decode(errors='replace').split('\n') if out else list()
+        commanderror = False
         report = list()
         if out_lines:
+            if err and ecode > 0:
+                logger.critical('CRITICAL: Running %s failed:', ' '.join(cmdargs))
+                logger.critical(err.decode(errors='ignore'))
+                commanderror |= True
             for line in out_lines:
                 flag = 'fail' if 'ERROR:' in line else 'warning'
                 # Remove '-:' from the start of the line, because it's never useful
@@ -1533,7 +1538,8 @@ class LoreMessage:
         else:
             report.append(('success', f'{mycmd}: passed all checks'))
 
-        save_cache(report, cacheid, suffix='checks', is_json=True)
+        if not commanderror:
+            save_cache(report, cacheid, suffix='checks', is_json=True)
         return report
 
     def load_local_ci_status(self, checkcmds: List[List[str]]) -> None:

-- 
2.44.0

