Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CA6624
	for <tools@linux.kernel.org>; Fri, 16 Jun 2023 07:11:38 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2b1afe57bdfso3937801fa.0
        for <tools@linux.kernel.org>; Fri, 16 Jun 2023 00:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686899497; x=1689491497;
        h=to:subject:from:message-id:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RJmRRUINsQsOUh1sYnU9VvtsK0es66VRJEv5r64auh8=;
        b=nvJpla8qFmwRJ2EUdmX91VJi3SZ12zp6Qe7PPFkNx0WrxUKD88jdwaAwDD66fZFtfw
         tL7Z8KUNOwyye1JRRluztPxGcoVk/q1GsTNlDZTZXsdcCeKDO0MZ7Y+hHEuhachWxE2p
         O2yS1qeV6o7ucXhNbYTxuMqGB9/JFVLgYqZWBDaoKo5dTpi6N38ztzKQvcCNxWKAR0ET
         V2lLOQnJ01DT+8sw6zJn+OwCZ2fupjTV3zoJOoWOl58yPCqx8EVRvL8PX5RcoAJa2rCj
         6unOKC9w9RH+2/gla3h83gsmzA5DbaXbdu7Q/PXPav+FKDWUaTwey0UzwuWIneooRCs6
         3HpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686899497; x=1689491497;
        h=to:subject:from:message-id:date:content-transfer-encoding
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJmRRUINsQsOUh1sYnU9VvtsK0es66VRJEv5r64auh8=;
        b=IAlGhj1vYhymIgEeusfs8EEdEvgIOEwFETZnI7HJThR2AfnaF8UKh5FlIMO4CYv4lY
         ukKAE89AxSc2kKHe0qn8R30M36HANx9WVGWjqOWzm6nvW8QshsVy6rLwgxZIA2i33Gl0
         6oya8jUa5MDgnlzFczjGExD8QULSyFmLqcv5yI8SU2kJd/bLMJhm7ZfO92gKcHHsm7pP
         5zB9tT4kNzXUWWBc5q6/XCCGPW4zTpC3af/cdnAQi1CwWL5LcDb39KOZ5Fd8ZZXR6mE2
         pBHXRsN+UqLhnCDB1PHsYMlIdikjFxZezlP5qtcGsmnAZ9I07WX4b2I5DNaI13GqT9VQ
         5u2g==
X-Gm-Message-State: AC+VfDwIHXl0dA3cu5ySm3n7Osxmit8Op1cfifRN5LfRruI/kwQ1T5KK
	zAT6K20MmC0uLIey7cRLgCLEp+M5VEWmfAFbrmg=
X-Google-Smtp-Source: ACHHUZ5iFVPiYxijSU7jUYII2JHWHnSKC8Q3vhKdOVvrktDPoANtUk/yUHLN7IKuYHjtwMWdrCAV+w==
X-Received: by 2002:a2e:3e1a:0:b0:2b1:e958:efa0 with SMTP id l26-20020a2e3e1a000000b002b1e958efa0mr892429lja.50.1686899496633;
        Fri, 16 Jun 2023 00:11:36 -0700 (PDT)
Received: from localhost (i5C740DE0.versanet.de. [92.116.13.224])
        by smtp.gmail.com with ESMTPSA id w21-20020a1cf615000000b003f8126bcf34sm1258727wmc.48.2023.06.16.00.11.36
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 00:11:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jun 2023 09:11:35 +0200
Message-Id: <CTDVYQ01B09D.1FUED4Y6IQUKI@fedora>
From: "Erik Schilling" <erik.schilling@linaro.org>
Subject: [BUG b4] resending drops previously configured prefixes
To: <tools@linux.kernel.org>
X-Mailer: aerc 0.14.0

If I sent the original series with a prefix, then resend will send
with [PATCH RESEND] but will no longer contain the original prefix.

I am not sure how one would fix it the best way, it looks like prefixes
are not tracked as part of the history. Maybe they should? I might drop
a WIP but still want to be able to reproduce a past version... But maybe
it would also just be enough to resend with the currently configured
prefix (+ RESEND)?

- Erik
