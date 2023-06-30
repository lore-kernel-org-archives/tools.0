Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFB810781
	for <tools@linux.kernel.org>; Fri, 30 Jun 2023 09:54:38 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3fbac8b01b3so14257075e9.1
        for <tools@linux.kernel.org>; Fri, 30 Jun 2023 02:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688118877; x=1690710877;
        h=to:subject:from:message-id:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1ynh/az7Lapc6a7KD5rmjBRJDFapxh0dnUBtfvgQz5I=;
        b=PywVivl0yIuZGS4Tr077FUMxaQDmTmRSNjpPauE46M2M3PIs5JIp8/WJyAix5epMYW
         O5PmGgDT/6H6LFGWbZN90GaEiVMOgVb9eQaEdi291TTmRHiICIR5wQaYtRtnF9ph7ujH
         /wEhGygB59oNZjYFYZ2ACkYha5PrcIYKPoiWb6TxWgMGdhnaDpwutJHk4EXyWKMxh9Ws
         mZ+Jr+1uD2gbRhb7LjJaZFltFtsAhEmF6hqc5lE2EerDLlVp80PXRAb7utbYuv5tfuI0
         1wrl01tipnUOdzui5kFMb7yZrw+58LX6L4jYFZeWmFW64p1pwOyAmvhErAftIp6+Xuz/
         nZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688118877; x=1690710877;
        h=to:subject:from:message-id:date:content-transfer-encoding
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ynh/az7Lapc6a7KD5rmjBRJDFapxh0dnUBtfvgQz5I=;
        b=RMO5mAzdz0SKqg+01AP5NmliHZmxZp77xSAUFqmjdt9c6FW26Cl3K3nv3V+A7H/aJj
         MIC+BPzVHqh0nuf5MZpvNLkB9dO6wxb1tmEz0ScW0gySv6lyl6K99FvofgjmMzrEhCGC
         k1p6DHVFNTkh6+uqhwguFz2XwZihYBVEnMeoujN6Sr3xEdxdA9rJQn9dJL/MMtiBUuxq
         6l6n9s4fUOR11a5tEEPL8XuO+ZqdIKc0L/JF/BZrjenZXqVnijXNJvimkNQeaVwtCI4g
         C2p85y3PCU5mk1f33BK1L4NwhDA5CyK1Fr1tIMHIV3kFpiIX2qprUiAy3KUaGX80SHwH
         lttQ==
X-Gm-Message-State: AC+VfDyGKPrfooZYxUXe/NBS/WKXwDFuHQWJ4JFeW2EDDSUG/VNC1irp
	oiMbjhysMsmdpSvLvvlMmEzHOrIioPot0nwrUJA=
X-Google-Smtp-Source: ACHHUZ6sVq3i8ELCV9vWn2XK2q6PBbbZwOjrnEuvEd5or2RQ8W+qGttC8egr4gXz76hOwgWq7Fqu0Q==
X-Received: by 2002:a05:600c:214d:b0:3f7:e660:cdc5 with SMTP id v13-20020a05600c214d00b003f7e660cdc5mr2304448wml.9.1688118877113;
        Fri, 30 Jun 2023 02:54:37 -0700 (PDT)
Received: from localhost (i5C743877.versanet.de. [92.116.56.119])
        by smtp.gmail.com with ESMTPSA id 21-20020a05600c22d500b003f9cb3c8958sm21690586wmg.3.2023.06.30.02.54.36
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 02:54:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jun 2023 11:54:36 +0200
Message-Id: <CTPW75Q2ISUN.251ELTNP6RB22@fedora>
From: "Erik Schilling" <erik.schilling@linaro.org>
Subject: [b4] Allow sending prefixes before [PATCH]
To: <tools@linux.kernel.org>
X-Mailer: aerc 0.14.0

libgpiod wants patches to be sent as [libgpiod][PATCH ...] [1]. However,
b4 always sends [PATCH libgpiod ...]. I found no config switch to change
that.

Maybe one could differ between prefixes and tags? Then prefixes could
be a _real_ prefix and a tag could be within the square brackets as
described by the docs [2]?

[1] https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/README?i=
d=3D4510231c95a087f58a155cf74164e403e1e0584f#n282
[2] https://docs.kernel.org/process/submitting-patches.html#the-canonical-p=
atch-format

Regards,
- Erik
