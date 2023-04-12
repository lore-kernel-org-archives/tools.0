Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DF93C02
	for <tools@linux.kernel.org>; Wed, 12 Apr 2023 19:06:13 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2465e4f1954so987687a91.0
        for <tools@linux.kernel.org>; Wed, 12 Apr 2023 12:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681326373; x=1683918373;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XvLYGm+wjP1kVvSfxjFeaObSCGA9GeYnTy2YhwNkcc4=;
        b=3ndtnhZ1e6U4Jj/m3irLfAnxlbLNbjuLh2s4aG0fAQlLyGOmF0pljHfsqGS8KSRv1l
         b21bB3zXYMbS06L+6XRDg5rRdwXfvFQS2gDz+ZOhzhbC0jug59pk+Rf+S2rSzAGrqQzG
         bf5huIqbDhW7BMjmVWpAi0QF/G8NF7hNETYdiBe3vOjAWDC3HPkY7zx5dGLF4BeK/XSn
         PERHUNHPeq3uc35CTRLwDOimDIRWx8uBZnhHXL3Rzk6VrG0GUptz+WcBTdNnelsbhkeI
         QnZfZ0lZCLMSdODcOl9qCcONet84C3LSUXxZ4yf2KjyxRobWy1J1+EHy5R3VS4SyykMg
         kxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681326373; x=1683918373;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XvLYGm+wjP1kVvSfxjFeaObSCGA9GeYnTy2YhwNkcc4=;
        b=ka38HgJO3l/HSkS6+hUa+vZHCfnCIAFUGC2xPi8v4aPAwEN1i7m2autiVWD38Xyhi/
         8UU2RwIAV/bbUg6z2+d/rbZrku5ZOwwfZWJmJZszNjbtEA+sBsGCkAQVT2Lyo3kUPbKW
         ZoyENvzL5S1w5RWSV8f+K+Vi1FMPbEEdV1KP/D9qTONRQJJuMPPG1yu4rkUgWyUZ9//w
         5Bi1JWgTvNkoG/U5RRGqOGf6BkY0ZG/bEXrqmCweTnlkaGB5Lu1yJXtxQnVbUTdeEDef
         lICQobZM1oMCRjhaE7KwoQ8DJ7D6f9AysT0pCFPttMeLayps385mWlU/tEXeSN4Y/2+1
         xWBg==
X-Gm-Message-State: AAQBX9f+YBAtRmSMg+NPz32Cu/5/A1sx9kpI13lI7w4NO39SR9yugyRN
	6bvrImG9+tqjyL4Gpk7tjSGAFSGhWuSy7RVyRzcdkuMWayJQ+ydmsyKyQA==
X-Google-Smtp-Source: AKy350aFn/FeWcQ4nYcHi9ps3jInDUJC5X9oswcdG2JYpdbJOO45tvqkwDnnthp/0AJPe91qDrL+dRYzhod8s5cS5Ek=
X-Received: by 2002:a05:6a00:190c:b0:62e:1972:fab5 with SMTP id
 y12-20020a056a00190c00b0062e1972fab5mr7491563pfi.4.1681326372554; Wed, 12 Apr
 2023 12:06:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 12 Apr 2023 12:06:00 -0700
Message-ID: <CAKwvOdncRCGiUA0Au-DOS0zt8KacouWxR2K3xQLdAS3E_8YpYw@mail.gmail.com>
Subject: b4 am and cover letter mistakes
To: tools@linux.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello!
A second recent issue I ran into with b4 was applying a series was
failing for me because the number of patches was being parsed from the
header, which had a typo.

https://github.com/mricon/b4/issues/2

I'm sure such cases are rare, but reporting it here in case there's
anything to be done in b4 (see something, say something, but this
isn't at all a blocker for me).
-- 
Thanks,
~Nick Desaulniers
