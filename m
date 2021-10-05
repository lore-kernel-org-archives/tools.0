Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F293FFB
	for <tools@linux.kernel.org>; Tue,  5 Oct 2021 08:01:57 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id y14so8696976vsm.9
        for <tools@linux.kernel.org>; Tue, 05 Oct 2021 01:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=O2JFNf45QICVwc2myqDmtUlVv0YZ7kVy4ki2pqVmfjM=;
        b=tQHATLjNjv/7Z6b0LPgokcUF+644wP/FlDlfo5Dkmte0LwrzwOOeHgifHOMnufHh4a
         ZhSQdKFLMP6xIJfZpBDA84JMNaTAPR+p3jTMRYopddw1yzIyrg2vjSQY51KWXpG+Jcrz
         UJeb2oLYMZu4mIHrbmZh3pEMUFj+ZOIJCeanp2gljdmE5Vg2t9NIk7Ty/qdQfjb6G8uk
         bnpTNeWVqKY9wsOW5KNjVGloetKwKQKVgfsGmj0v892DIqMFowCIhXHADwa0QZ+Gy6r9
         /NfHFrwAOf+nOC2VW2Yl3KvWJ327ldJcODWKB2m2EEiKW0tWaEK+XhlUkXxF04DqDVuS
         S/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=O2JFNf45QICVwc2myqDmtUlVv0YZ7kVy4ki2pqVmfjM=;
        b=5y+S9nnV99lxs63drXGBC/1GQsqRYqfV1fTXQKsF5gslojNUrRTiI/AdiNDHXEdeHH
         pIZRNYYo+ZssNY3gKtKjIDx7s15654pNCK1SFwBLZPq2CatNQ4W0OhlVeXPGELDRmQY4
         pJSegqjv28rocSvoRoJ877IOlge5UzxeQyi8p7lez4OYwCl36Eb7inwJHTgHPeMCaGAB
         TrXXvej9SPqS8fqf6aiXoTIxqUp2Q5JYl4uFVF+ZuwxDZFhgV13n169L/DXNQpjK5VF3
         t30CuB4FpqsabOVhERI/ypMQdASiRSdl8oIKCi5lnKZhgSigQiA7IPR+sX5TKHTx+kRe
         uBnQ==
X-Gm-Message-State: AOAM5321ReqTIGHwNMgS2bpXlwt777NXLWSUVYpayDBJWQCAXEFZjhaA
	jiaVz9VFePp4WNHIu6EYxa+pP6RceDs2aR1PZSjKYw==
X-Google-Smtp-Source: ABdhPJzjftn8ErpKJgR6ovaIaYCi1Ko6RI4IVWUY3RTfDL9TkcwIgm6IyH4GWndshID6jcIGtqMTye67Ml/YI9SKo4o=
X-Received: by 2002:a67:f588:: with SMTP id i8mr17466733vso.40.1633420916787;
 Tue, 05 Oct 2021 01:01:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 5 Oct 2021 09:01:45 +0100
Message-ID: <CAF2Aj3icJtU+wacosM-LO2aqMChWL69T6bf7dK3xqPMSk6Ux3w@mail.gmail.com>
Subject: Acked-by missed when applying
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good morning Konstantin,

Can you think of a reason why `b4` missed Greg's Ack here?

https://lore.kernel.org/all/YVLA14jbwqXjNM2f@kroah.com/

```
+ b4 am -3 -slt -P_ -o -
'<1828cb783b1ebca0b98bf0b3077d8701adb228f7.1630586862.git.mchehab+huawei@ke=
rnel.org>'
+ git am
Looking up https://lore.kernel.org/r/1828cb783b1ebca0b98bf0b3077d8701adb228=
f7.1630586862.git.mchehab%2Bhuawei%40kernel.org
Analyzing 2 messages in the thread
Checking attestation on all messages, may take a moment...
---
  =E2=9C=93 [PATCH v2] mfd: hi6421-spmi-pmic: cleanup drvdata
    + Signed-off-by: Lee Jones <lee.jones@linaro.org>
    + Link: https://lore.kernel.org/r/1828cb783b1ebca0b98bf0b3077d8701adb22=
8f7.1630586862.git.mchehab+huawei@kernel.org
  ---
  =E2=9C=93 Signed: DKIM/kernel.org
---
Total patches: 1 (cherrypicked:
<1828cb783b1ebca0b98bf0b3077d8701adb228f7.1630586862.git.mchehab+huawei@ker=
nel.org>)
Prepared a fake commit range for 3-way merge (a0fd2a641207..b603f718647d)
---
 Link: https://lore.kernel.org/r/1828cb783b1ebca0b98bf0b3077d8701adb228f7.1=
630586862.git.mchehab+huawei@kernel.org
 Base: applies clean to current tree
```

Thanks.

--=20
Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
Linaro Services Senior Technical Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
