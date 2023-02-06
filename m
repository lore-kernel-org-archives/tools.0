Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15185CAB
	for <tools@linux.kernel.org>; Mon,  6 Feb 2023 18:23:34 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id n13so9316173wmr.4
        for <tools@linux.kernel.org>; Mon, 06 Feb 2023 10:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares.net; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S2ePytGdz/O3wSsLAIZV5u9qK9qkOcrsfSioxbf2AUg=;
        b=vmhCpiN1FISLJZ/NFItkHcTgmo2u5QmHdQA0+GDPBQ2TIYo2ht2+4VJBEYUEZiAnys
         OtmL/tSx8OmL1+Lr5EAOz4qHvQABpwEcsuDDuVjwrvRXSd0d1S2Ou5lvhp7W4T10Hyuu
         HKlkglLQVuA3sbb476Fpp6s64Di83YXMsf+5pUXsFb69Fl4iNNYTWHYghIlEmsQYQeju
         UJOuLi0DEvg1s1uaGg+Q4yOj7NtkBHHSYg1ZGC85SBItU9EuqzN2mrw/F9kv/W8aVWk7
         FJtlOB8O1JT0c1g3CtG23ZZi24hVf3Wi7lfiw8M8vcgbmJN4WgUK47FbeK1IS6rjiVe1
         4xlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2ePytGdz/O3wSsLAIZV5u9qK9qkOcrsfSioxbf2AUg=;
        b=pwBA00etPQFTPFS1KA7WqYhwFZK5Jfp0q3JJArZIqHIzQCpZ4zG+glaZ1gElvkzpmC
         Ncr6IhqczPYN3XZJKrurctQ5JaeXkEdK/sVvbqtHQp3FaRDVhIbKUKZEbR04t4UVXiEY
         VLcHKF2Dd48Yx3pRCVmk1WE9ne2IJofD0uGwNZhVxPgazxRU9dCioB2xuscvYnWT0dD0
         Gz5suLrW42bghjTy1Jzp4MJ3KjJMkqy6NHAsk1PWpSi3dY+KOHVCrwQEKN65dhigQcUR
         W4nh3Jzs7vlD9g2WyGWUdwbuL4eOFYj+1ATiDYVPh8Wr1e7NEbfTZN+tIXxvcUQRe3n7
         Q53Q==
X-Gm-Message-State: AO0yUKWR+9YrnarVpcJNQHe7S9vuj3YAZmBy+Fb2wRFFL/CF7CBE0DT0
	V72+a5G4Ip2yFsMEvXG1wXYYs1c0WXWaE6CZoBs=
X-Google-Smtp-Source: AK7set9Hil3w3tl4J2QMFTmmEknoSr1ZTo2RdWfJNMEVY8wfzEK2E/yKJZNQlS9gN0d+aMI19KtCmA==
X-Received: by 2002:a05:600c:44d4:b0:3df:f7f9:7bc6 with SMTP id f20-20020a05600c44d400b003dff7f97bc6mr593945wmo.20.1675707812385;
        Mon, 06 Feb 2023 10:23:32 -0800 (PST)
Received: from vdi08.nix.tessares.net (static.219.156.76.144.clients.your-server.de. [144.76.156.219])
        by smtp.gmail.com with ESMTPSA id h27-20020a05600c2cbb00b003db12112fcfsm12871588wmc.4.2023.02.06.10.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 10:23:31 -0800 (PST)
From: Matthieu Baerts <matthieu.baerts@tessares.net>
Date: Mon, 06 Feb 2023 19:23:02 +0100
Subject: [PATCH b4 RFC 1/3] ez: prep -n: use fork-point as base branch
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230206-b4-prep-fork-point-as-base-branch-v1-1-2732e0c32f5d@tessares.net>
References: <20230206-b4-prep-fork-point-as-base-branch-v1-0-2732e0c32f5d@tessares.net>
In-Reply-To: <20230206-b4-prep-fork-point-as-base-branch-v1-0-2732e0c32f5d@tessares.net>
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Matthieu Baerts <matthieu.baerts@tessares.net>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010;
 i=matthieu.baerts@tessares.net; h=from:subject:message-id;
 bh=1rdF60Dj+3OB3sdeWNdGok8Aj6oEyGWH/aNeHPPg2xY=;
 b=owEBbQKS/ZANAwAIAfa3gk9CaaBzAcsmYgBj4UWieNGTlfW5bmUJV7aFmRl7eazmtQ5gbOSNR
 CDLW2sgASmJAjMEAAEIAB0WIQToy4X3aHcFem4n93r2t4JPQmmgcwUCY+FFogAKCRD2t4JPQmmg
 c8BTEADpmxZ1JvTQQNF74YXnQc4lBLYQl841KJyYuHOGalMvsqUiAnDi3gls3OB4GMPEciXahV+
 9VmFKFBvajK8CY9y+BUQ11Gav8O7A4mroHhjB0SHCvcWBZyukPMzHq0U2eS5pqMFaE8lMlPndGQ
 om5OX5otI3jEOfqgGpuwATj9cTZKzLuui3HTFbZ4HqXMz5ki9LRwaHZhhutGAFUhKp+0RsSB7oS
 pTsBYCiwehd7qG0COEFpxFVg4TbxRkbXJvAI2FcDigXOOeJ4cx1gj70BA1T+kWQJTHwDXyxpeYX
 av4bqyG8UdvqPLOZ8BTHxqlIWv89XbopWst3WuRRafiyeu/RYwQGFXwmcoTim5gdBe6m1Pp6uL7
 xuXMvv7eMC7k3O0YkQlO4dANgjjG/R2wqaYGxXF9akF7eHI+/5ZM8oc8JTbro8utQDQYFN531tU
 7gjkKWPlbkSbaVQf9Z8Q6hiHg34XEPQNWDg1wfU687okW40ZUrNtDqRkV3m3TGaWw2yODn3VQ5h
 GGcJI69xxuNgkUlI5YxRM6DeqNfchwi6X9kOpLOG1luygf/HxL18NIU9UAJb8Soyyz+xkpXfDUy
 vh6DaDTd75NPaYx6WA0W1N2Em42fKYyAErBp+KzXkOBWg2O12LPBo9H4EDVTR6z1a0qalHaVAUv
 AKnwqsz5dlEPd2g==
X-Developer-Key: i=matthieu.baerts@tessares.net; a=openpgp;
 fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073

When creating a new branch with a fork point, use it as base branch.

Without that, when using:

  b4 prep -n ${NEW_SERIES_NAME} -f ${FORK_POINT}

The branch ${NEW_SERIES_NAME} will be created on top of ${FORK_POINT}
but the current branch will be set as base branch. ${FORK_POINT} can be
quite different from the current branch.

Signed-off-by: Matthieu Baerts <matthieu.baerts@tessares.net>
---
 b4/ez.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/b4/ez.py b/b4/ez.py
index 74afddc..2722c6c 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -345,7 +345,7 @@ def start_new_series(cmdargs: argparse.Namespace) -> None:
                         basebranch = mybranch
                         break
             else:
-                basebranch = mybranch
+                basebranch = cmdargs.fork_point
 
             if basebranch is None:
                 logger.critical('CRITICAL: fork-point %s is not on the current branch.', cmdargs.fork_point)

-- 
2.38.1

