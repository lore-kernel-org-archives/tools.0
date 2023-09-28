Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E5A749B
	for <tools@linux.kernel.org>; Thu, 28 Sep 2023 04:54:23 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9b1ebc80d0aso1287204966b.0
        for <tools@linux.kernel.org>; Wed, 27 Sep 2023 21:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695876862; x=1696481662; darn=linux.kernel.org;
        h=message-id:subject:from:to:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QqAfxeZYFxRaxu5nApggFRZHaNOiPGKQ1gySmr1YpEs=;
        b=kkQHyeEa3ep/BlplsjgqCUK7XFglnwQKXNKeJWIECDnQ4SJ2VCfFg2KuR663x0U75z
         Zwc20rQ/ad0Ma2pLnJ+0RRIqNBe2MjbxZv1L2ml5Bs3xOSiEg25i8m4jq9bCnAIQRlaq
         wUTblkoFXa5WM4Q2uib7vonadp/sTt4PvTBdnXcrj0M1ocxMYh9cGMNFLGhEkhdifysc
         xq2SLsRbfVrOUUFm0DZCIUNSUrR/ZkU1XT9vp4mZtT0qoWo92EzgwMNc62XOFfFfqRaS
         BYdhFc5klbNc7CKPYFC9nXf1nBOVbcvfTaBD+JJtrb+S1S3qWQsHtt/e19jxU1ifjG0u
         +c4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695876862; x=1696481662;
        h=message-id:subject:from:to:date:content-transfer-encoding
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QqAfxeZYFxRaxu5nApggFRZHaNOiPGKQ1gySmr1YpEs=;
        b=ki1MbBNnHXr4ulgnoo+qfB7wYU2r8m/kv04ZOVZsj7HIiac95V9sTwmdRLCZXxsMuB
         2/mwjrxfqGxAuHPhPnWoAvJ/ELMxBj6NCv1KdzLAUzbDuXGDzMrRpMBuvkqyeBvKp4qd
         /t5rLDetuM+esBmDhGmKIigeO82UAZ1o2d5OmddkVrDnnPqgnFPnbGDY1CLAuOKElW7y
         mvhwsBWDu9Yj0nhXKg+v/22TTQLchrC9SsvAYsddIN5Xhezgf8YrRHwF1yWxtHdYokcP
         WE1fcP5gYYdrEt+AsF+iPzlHvpCkhPg2wAmNDPehvC0E9JyRbZW2Dr3zH3SIcLKb24zR
         7nEg==
X-Gm-Message-State: AOJu0YyPSApi5BiUqD5nYHLxFgBG16k89SMC2D7owyTm9SWk6Nv7o+Il
	JBpCR/opwRNrQa2fNvkUL8UIX5eumONkgoLdjyE=
X-Google-Smtp-Source: AGHT+IG142RXWNTkC43CRMfeIyTNCPMLCtlfCmds45dqKeP1S1yGB90cIHcgEbDxazOzQxP88o8k2Q==
X-Received: by 2002:a17:906:2112:b0:9b2:b9bd:a369 with SMTP id 18-20020a170906211200b009b2b9bda369mr159896ejt.45.1695876862357;
        Wed, 27 Sep 2023 21:54:22 -0700 (PDT)
Received: from localhost (i5C7438B3.versanet.de. [92.116.56.179])
        by smtp.gmail.com with ESMTPSA id d11-20020a170906370b00b0097404f4a124sm10228720ejc.2.2023.09.27.21.54.21
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 21:54:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 Sep 2023 06:54:21 +0200
To: "Kernel.org Tools" <tools@linux.kernel.org>
From: "Erik Schilling" <erik.schilling@linaro.org>
Subject: [BUG b4] To/Cc addresses from cover ignored when sending single
 patch
Message-Id: <CVUA1530PTVV.1EL4MWO5N2JNI@ablu-work>
X-Mailer: aerc 0.15.2

Hi!

When sending a single-patch, it looks like the To: / Cc: fields from
the "cover" get ignored:

  =E2=9D=AF git log
  commit caa2c0499a3aa347804c305a8e0394f6736df7a5 (HEAD -> b4/useless-clone=
)
  Author: Erik Schilling <erik.schilling@linaro.org>
  Date:   Thu Sep 28 06:34:22 2023 +0200

      Some commit
   =20
      Signed-off-by: Erik Schilling <erik.schilling@linaro.org>

  commit 7850ad017545e8cd16872f07bf774f1549a21624
  Author: Erik Schilling <erik.schilling@linaro.org>
  Date:   Thu Sep 28 06:31:59 2023 +0200

      Some cover
   =20
      To: Linux-GPIO <linux-gpio@vger.kernel.org>
      Cc: Viresh Kumar <viresh.kumar@linaro.org>
   =20
      Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
   =20
      --- b4-submit-tracking ---
      # This section is used internally by b4 prep for tracking purposes.
      {
        "series": {
          "revision": 1,
          "change-id": "20230928-useless-clone-af75c3a58df7",
          "prefixes": [
            "libgpiod"
          ]
        }
      }


  =E2=9D=AF b4 send -o /tmp/test/
  Converted the branch to 1 messages
  CRITICAL: Could not find any destination addresses (try: b4 prep --auto-t=
o-cc).

See example here: https://github.com/Ablu/libgpiod/tree/b4/useless-clone

Once I add a second commit, everything works.

- Erik
