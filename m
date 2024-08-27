Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93F21C93A3
	for <tools@linux.kernel.org>; Tue, 27 Aug 2024 15:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724772636; cv=none; b=IsyiWyZWBrcI6Ml7y4uGYe8SQ1POtJjXgO2gglmxZiWVrwmEvT0RsHD7dU+bZhIax2BX7ZERInyGorpZiscpvY1wO1vV5yYrRV8PC6e/GrTJXHTqBrKIaGSbql2ygck8nx36NKD/fOVfeTL5OmWU9gImxDhlPkVYWJnUaWfxrkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724772636; c=relaxed/simple;
	bh=glfpCJwhPmxqM7k/DLmYEGR8e/skKs7Nht17AwNaq4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RPmPmyEsk8/JsaTtzApVdxg2HTEnIlbh1m/6oOTgJbnGEDKCTljEC3XoRlLAIHegU43UcPUuZ2EZbVs/MORwYLd8TGTdXICqU/ffgNaeIv9hjBU1DMS8yQuVQbntVi+PqiirHLrpq35QROU8nhjupxvhFd3tsXfKhSHyu/DFLfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pSR4z+Hx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pSR4z+Hx"
Received: by smtp.kernel.org (Postfix)
	id 9401EC4AF65; Tue, 27 Aug 2024 15:30:36 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 97F7CC4AF68
	for <tools@kernel.org>; Tue, 27 Aug 2024 15:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 97F7CC4AF68
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a869332c2c2so851075066b.0
        for <tools@kernel.org>; Tue, 27 Aug 2024 08:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724772634; x=1725377434; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ps92b5sE7fBQP/wQkqJo0DILZLwIhLUpUQ4zPbQSbH0=;
        b=pSR4z+HxEmM2+F7v+1pOPe5dGeBCWzQ/JyhxpAHkvg5bN7FCwVyqJZSiu/gp608oGp
         yIAqt+DmvmEv99f9lM/xWrhzYGzO+BLNEMaPtK7GyCn13md4hiHwAJ/7PBAvU4k4oagT
         VdPgzNIGXwLMVoeL0R4oSQASiWPFVMgHJJsELIDUI+HyFkwt4rwkyBTYMYkVBCWqZ6G3
         0PIqLs31WPKH4HZq8NJ6/I0Wgd2XLtE/rzOlo+AltYrOfsjQevpGMMHwNVDZMO4oc+ch
         ZLmqL0FVhi2bAi1sR/8Kl9G7IgQDxAG9xlthvQS40bPPblH+OAWJxq92UYN8TxS2NJal
         J+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724772634; x=1725377434;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ps92b5sE7fBQP/wQkqJo0DILZLwIhLUpUQ4zPbQSbH0=;
        b=grGCwHI7rrZMMGsczg47yE4bVQl1cAZJkY8VmhoFicPgKkKQ16pjicTPSVSY0t3tWE
         AUCLL2tZT0mbAvWngZeZVHeBj6GHIMsiIAhJ26abdrOOZ6RYgWIbIAcl+Ezx8O0Hh4E+
         yI485aHOvx9EHKztI5fyCgCRfWTQTjIQA+ye9cdivX92S0FN0zCsMGcHxstFN8xF4RFB
         6zCm/WGrZbWdVCCKbuvj+yxwDsO7BkzU8enj4Sf0SSV7rcGu2U3JcjVLhnWiXiv3kKwe
         sBbyvJGI2VqnngBaUxEqhZzRjoTiGhajnPFf/ES2uMTYeXPlz4GCig2GAD7gDNc8CN8p
         ZT6Q==
X-Gm-Message-State: AOJu0YxBpRbo+soM28m7BhacynGw7qd20e8LE72arzntpAoAGHZEGLzL
	654SIacf4B5UcMxOF36mDSMD/EeMjPyYRjiUjUm9pKPTnlCrfJV8WBfOB4bmVqVFiDz9PUiIPRi
	uKL0=
X-Google-Smtp-Source: AGHT+IFGS+hf8VWdkVHqiwvJxfMWOZZ6Xms1Ruj258Nibglsayd0RrSqaHfkREuwNwWje9GDweXmow==
X-Received: by 2002:a17:907:7e93:b0:a77:ab9e:9202 with SMTP id a640c23a62f3a-a86e28950f4mr316423366b.4.1724772633560;
        Tue, 27 Aug 2024 08:30:33 -0700 (PDT)
Received: from [127.0.1.1] (adsl-242.37.6.163.tellas.gr. [37.6.163.242])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e582d496sm122992966b.112.2024.08.27.08.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 08:30:32 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 27 Aug 2024 18:30:17 +0300
Subject: [PATCH b4] Create patches with --full-index --binary
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240827-fix-binary-patch-v1-1-98a3090a69a4@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAjxzWYC/x2MywqAIBAAfyX23IKKPexXooPaVnux0IhC+vek4
 8DMZEgUmRIMVYZIFyfeQwFZV+A3G1ZCnguDEkqLXnW48I2Og40PHvb0GxrpWudn2zfCQMmOSMX
 5lyM4DdP7fjpiPbZmAAAA
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.15-dev-0cffc
X-Developer-Signature: v=1; a=openpgp-sha256; l=1963;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=glfpCJwhPmxqM7k/DLmYEGR8e/skKs7Nht17AwNaq4g=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm16ZkVZOTZJYklZN2tXNW4vZXFnQ2IwVUVEdmlQClhwTlJMNUdsNkxneEhsT21Q
 c2FKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKWnMzeEdBQUt
 DUkIzS2Nkd2YzNEowRERERC85TWhBWFkwSTFmVFhnN0JDczVLaUd1Y0dyUklHUllubFEyY0JEQg
 phdFRSU3ZoOHFaeDl1QWJQMHQzZ2hUVTFzT0pkQlN1V3FKb0ZMMm1ta0V2N0JubnhLdVBFSEZmV
 ForRTdrRU1oCkcwbkFiM1RlNTBOVVQyZk1sclo1b1U0ci96QXZNZUtOb3hnQ1NsUUwxVmY0OE53
 bkVCTVV5SkRMNGVBaytDc3cKU0hEK001K1EvdktwdXgxcVRHeGRIelY3SmpFbE4zWXd1VGtiYjN
 xREVvN1phT0dtdWk3eEtqTndOenYwRHRHaQp3a1FWNDlkcFJ1OStTdWkzL0YzdDk1eUJLc2p3Vl
 A5VHdkRThCUWJFNC9YbTdGQUUyTmo5VER6VnQ4VVQ1SGNGCmRHc01sZnV0Y3NqRURGZ3ZsTjQ4b
 1hpNlU1cXhtUVJrYVd0bzg2S29nL2tZRVlXWkdpaVFZNmVzUTZNOE8wV2oKMU5kOTY5K2x0OUYz
 TFNnUUp3WjhIK2F1TEN2dVNuckprWUszdDVuR3F4RjFiYUhNU2dnN1hZZDZSVlRVNHNrUwprS2l
 xaGRhcXhWTkhxKzNkcndWTndiVmxncnlNRytuWC9WMGVzaTYwY1gwMXlETWk4Q1NIV3hTaVhPdU
 NUYnNrCnhDYXhoaGVTdTNVRFI2YWJid3FSeXJsSTByN3A2clBDeEZMRTNjS3JhMXkwbUxLK3FPT
 Gx1Wkt5NVQzRk12SGkKMUtNUjJXaWFiRnZqUFN4UzJxcVl6UFZzTDlFVDloUHBnaVM3QzhGK3d0
 eGtaMGM4OFh4SVpwSjlRQjRvd054RQpEQ0N2dk80T0lGSW1rQTM1Q3htazlPWm5RaFZGeDczb3I
 5Y1dnNFlkL3gyengxNXlMMXNYL3ZBbms0OHMrZGdRCk5la1ZaUT09Cj1FS0NrCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1

If a patch contains binaries, the git show command b4 currently uses
will not generate a patch that can be applied by git. Add --full-index
--binary flags to correct this.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
Commits that change binary blobs are not correctly formatted as patches
when using `b4 send` because by default `git show` doesn't include
binary data. The result is an "cannot apply patch without full index"
error from git when fetching patches with b4.

This patch adds the necessary flags to amend this.
---
 src/b4/__init__.py | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index ec230e7ace663516c6bec8cf0ce9fd87f2218d23..e43b836547244c1cffc071067037dbe393ee4042 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3424,8 +3424,19 @@ def git_range_to_patches(gitdir: Optional[str], start: str, end: str,
         if commit in ignore_commits:
             logger.debug('Ignoring commit %s', commit)
             continue
-        ecode, out = git_run_command(gitdir, ['show', '--format=email', '--patch-with-stat', '--encoding=utf-8',
-                                              commit], decode=False)
+        ecode, out = git_run_command(
+            gitdir,
+            [
+                'show',
+                '--format=email',
+                '--full-index',
+                '--binary',
+                '--patch-with-stat',
+                '--encoding=utf-8',
+                commit,
+            ],
+            decode=False,
+        )
         if ecode > 0:
             raise RuntimeError(f'Could not get a patch out of {commit}')
         msg = email.message_from_bytes(out, policy=emlpolicy)

---
base-commit: 99b128995f27cd9aa6fa8adf7588f339919ac14d
change-id: 20240827-fix-binary-patch-91b6bcda8509

Best regards,
-- 
γαῖα πυρί μιχθήτω

