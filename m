Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9981A6125
	for <tools@linux.kernel.org>; Sat, 10 Feb 2024 21:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707599913; cv=none; b=YETqv59OeLrHz7JpaIydTwBuwZG3R0jCip57FdgpWXoKJD6jK0Kuf0pKm3IgirjNi8Awl+4AoUNoqxKSXIrJzC5fIIRdj9CAnIBkmVcCU6qbRnKsrXVz11mVNkx7qIRH8s6TOIhnorZqwXXDHfQqbmuD5TyTVV80N37r/IyL2hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707599913; c=relaxed/simple;
	bh=SVzCDTaG2GhpC/fJhP+OTviAzlLNcbYQzvx+Kw9YdfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aDBtjr7CIkNglHvQnH4dtyyg2YdRFbRBYmFwAGwvNA83QYQk0bwIQFksRTk8ZeCf15MOXAvYlQ2b68Mr0eRdrxSBVHc74Smqjo4gVUUBP+LAQqATACmaC9Wx3fCNht2rvZF1AJTBUffwGBpZzxUb0/znwNhdt3Ec+/RKRzH8I10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTHCYs1/; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTHCYs1/"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-42bf29aff0dso12981581cf.3
        for <tools@linux.kernel.org>; Sat, 10 Feb 2024 13:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707599910; x=1708204710; darn=linux.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zMzeO0wrzZUTwyfDBN6pX0/zT69vnqJU8vtV26igbTI=;
        b=LTHCYs1/zK2pL5XKK8sfL7qHHMCSWsL7rRdkskTyvSyFHjHfKMPmBPnUSqYiZXlYYI
         X65LvAOyq34BFNsaiE+BXHPsEg2X3rxlohOZgE08h4OftmMqvnylfDO4IWWMmFKTtoDj
         kFtMCk7dmb89yxbjqe1RnM1eXovUrgChwMStSGkRW/K4abiK0YqsySmGB/EKQD6JKviY
         tVMVPA91QbVslYj07uhoAwQmHixLSHOyN0UfkEL0r2dxY4e/9bDjkFV8rj+UwZunWeSS
         z+A4oiivmuMHdE1wY/lMlfoMC69KGD0h81hMwyKYFbltkVN3UdD/WF+OHBwZBSkKau7K
         Jo6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707599910; x=1708204710;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zMzeO0wrzZUTwyfDBN6pX0/zT69vnqJU8vtV26igbTI=;
        b=vk4Y+VgkW7uKwMrRruO7Nvyrer5ZxS/CvPHst2k4a8Xr4PgKW6l76+udaTLeX98RhZ
         JCH4J1OHSG3dBuBQUhTcm6muRH+HitHD0x3Ef+7Txj4liymdhNK1i9wgDlgz5854DsB1
         je5/TBpLStc2l7wmyZrwUXfyTTudUYPuPa/NT418FFUGFXom+Zta3H0zKohwrPT35SzT
         lInn9E0HD+YV4e/Sok641coRJZm97vki8b5kRPLUsTkiANkomDUFB9qT23FlpEgncGfd
         IwgZxSS1ZGqHPZS8b09NieHZzi5L55OvoJ9RScvAUI9AsG987YUfRaoQD7P3E3w1I5Qs
         DHzw==
X-Gm-Message-State: AOJu0YxNci+yNG8uANCJX7Yenz0RbjKUurgSZcyqeoO/VX50IxvJCLW/
	+7bElQt/2qJMKD2O6kWXnfKxUdM3VpaB2TSNR6tpfCbqDXcD0VHC17QjbLMWIRs=
X-Google-Smtp-Source: AGHT+IEH6R68yGttvPjGcGRPeocrSgj8Qg1U91PLGN4rR4Dn/2lYpvushPH0bxP3gZNhmy8eg0CmQQ==
X-Received: by 2002:ac8:5a46:0:b0:42a:687a:fda5 with SMTP id o6-20020ac85a46000000b0042a687afda5mr4575839qta.39.1707599910196;
        Sat, 10 Feb 2024 13:18:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWlKhwq0x1ArrHnw5LOnSfWrz2/WwahdDg95OFqtuPUUThWNcUgGtdNXVhN7fPfN2wa6RB3cGu9AnjpTsk6ix/dTnwfFBJFvc4Bb34GPg==
Received: from [127.0.0.1] ([2606:6d00:17:3855:7446:337:f37a:d47])
        by smtp.gmail.com with ESMTPSA id l10-20020a05622a174a00b0042c010ec2d6sm1741437qtk.97.2024.02.10.13.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Feb 2024 13:18:29 -0800 (PST)
From: Philippe Blain <levraiphilippeblain@gmail.com>
Date: Sat, 10 Feb 2024 16:18:16 -0500
Subject: [PATCH b4] ez: fall back to regular merge-base if --fork-point
 mode fails
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240210-ez-merge-base-no-fork-point-v1-1-b3f82cdd3bee@gmail.com>
X-B4-Tracking: v=1; b=H4sIABfox2UC/x2MywrCMBAAf6Xs2cUkNiL+ivSQ1I0Nkge7UcTSf
 zf2OAMzKwhxJIHrsALTO0osuYM+DDAvLj8I470zGGVGZbRC+mIi7t47IcwFQ+En1hJzQ3fxVlu
 rQzidoR8qU4if/X4DP8LU3Z55dnle/t9Xlcbk0jE5acSwbT9gMP2gkwAAAA==
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Philippe Blain <levraiphilippeblain@gmail.com>
X-Mailer: b4 0.13-dev-71c1b

If the 'git merge-base --fork-point' invocation in
ez::get_base_forkpoint fails and returns nothing, we abort, saying
basebranch and mybranch have no common ancestors.

Depending on how the current branch was created, and the state of the
branch's reflog, it is possible for this invocation to fail even if the
current branch and the chosen base branch do share a common ancestor,
for reasons expplained in git-merge-base(1) [1].

Support that situation better by adding a second invocation, using the
regular merge-base syntax 'git merge-base mybranch basebranch', and only
fail if that second invocation also returns nothing.

[1] https://git-scm.com/docs/git-merge-base#_discussion_on_fork_point_mode

Signed-off-by: Philippe Blain <levraiphilippeblain@gmail.com>
---
 b4/ez.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/b4/ez.py b/b4/ez.py
index 7baff8f..bad8c4a 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -233,8 +233,11 @@ def get_base_forkpoint(basebranch: str, mybranch: Optional[str] = None) -> str:
     gitargs = ['merge-base', '--fork-point', basebranch]
     lines = b4.git_get_command_lines(None, gitargs)
     if not lines:
-        logger.critical('CRITICAL: Could not find common ancestor with %s', basebranch)
-        raise RuntimeError('Branches %s and %s have no common ancestors' % (basebranch, mybranch))
+        gitargs = ['merge-base', mybranch, basebranch]
+        lines = b4.git_get_command_lines(None, gitargs)
+        if not lines:
+            logger.critical('CRITICAL: Could not find common ancestor with %s', basebranch)
+            raise RuntimeError('Branches %s and %s have no common ancestors' % (basebranch, mybranch))
     forkpoint = lines[0]
     logger.debug('Fork-point between %s and %s is %s', mybranch, basebranch, forkpoint)
 

---
base-commit: e790d97805add21c1c5fe22642e403b8c8889ed6
change-id: 20240210-ez-merge-base-no-fork-point-a8b51551ff36

