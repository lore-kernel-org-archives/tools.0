Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979C1A29
	for <tools@linux.kernel.org>; Mon, 18 Apr 2022 17:30:35 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id z5-20020a17090a468500b001d2bc2743c4so1140162pjf.0
        for <tools@linux.kernel.org>; Mon, 18 Apr 2022 10:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=WPwbxLpjhjXXBXZDspAbvLUuVppAvjsqB5oy1CvKcQM=;
        b=CbC3Ee1ENp5Mz/mXbGcXtXtjbmx8e+2FKsIPz+6nbHsbgOyDL5BtBC1nAaxLp+TvnI
         e+/VxYdMe18wR6QFBPnJOxYBKOBPQnq4XgnX9BX++CdV1RfdwvRxRF98GAdkfysjDFLv
         CmjUBcgtMdFOFRWgQjxLPlFx1/W3wKDnmCE3zEaksxo7fs2C4udtuDvLU2r49ZHX1MDC
         5UVEtP8dkRjC4cMUpA1W7qFnXt3J477ULof6vkQxCQJwjPwrD6OCtUmikmzOaML5+FVi
         /Tsh2VyYOOcLYMGci0Zr1rY/CQj9fQYTpfPqVIHg9W/EHlAYnZ6PIjgu6YLmx9DCRf1o
         A+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=WPwbxLpjhjXXBXZDspAbvLUuVppAvjsqB5oy1CvKcQM=;
        b=bsdEf1zIPumH+M9iwIQxbs+v6p1eX2L8iCafFoOY2Dau6CKA3nGtScqYWQZh3HTnOB
         0qzP+/UMYKDpWTbeNGBXXRLi2rik4wsSTepSQR6XLklfwtu52z12y5n+NoQDh0cl6VOg
         pHHKlQlQJuGpindCzAgReui5uWmzda8HUmY6Ma6cwiv11bJ3S7fNQqHJzsUX75a9FBLB
         6Mm052cjxJJSAErxaCloDkZxg4r3eQ3+QgrSbRjFAheBQ3an4vnR7dI8Z8EYvwTFMWWE
         C1xrnwvMgbb2I8j3rTPYCHnrNTXf9WzCf97WbnIPcMWpJnkTY71QxWsdncRSw35Ixv0N
         N+Cw==
X-Gm-Message-State: AOAM532T7IWqR7EVAwhag/TuMDwqMwW6vP6njI120UeFil+3Y1YW3ayP
	ovOv1WprH3B/qLvBwIMuJ/j6BVuq/fxfag==
X-Google-Smtp-Source: ABdhPJytc5CFZoZd4QLE5g8+sUXGZXDjXrKXt8Azh2arRinlpAwvlKy8pvbIL0QI581ldrq9jeTcKw==
X-Received: by 2002:a17:90b:1e0c:b0:1d2:7f67:f56c with SMTP id pg12-20020a17090b1e0c00b001d27f67f56cmr9567169pjb.69.1650303034616;
        Mon, 18 Apr 2022 10:30:34 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:200:ab4d:a27d:4699:2552])
        by smtp.gmail.com with ESMTPSA id 96-20020a17090a09e900b001cb62ee05besm17017982pjo.55.2022.04.18.10.30.33
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 10:30:33 -0700 (PDT)
Date: Mon, 18 Apr 2022 10:30:27 -0700
From: Josh Steadmon <steadmon@google.com>
To: tools@linux.kernel.org
Subject: b4 doesn't notice updated base-commit
Message-ID: <Yl2gMy2Fgpe0TUZ5@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi, just noticed this minor bug in b4 v0.8.0: when fetching the latest
version of a series, b4 seems to always advise that the base-commit is
whatever was advertised in the first cover letter, even if the
base-commit changes for later versions of the series. An example (from
the Git list):

```
$ b4 am -o - pull.1161.v4.git.1647843442911.gitgitgadget@gmail.com | git am
Looking up https://lore.kernel.org/r/pull.1161.v4.git.1647843442911.gitgitgadget%40gmail.com
[...]
 Base: dab1b7905d0b295f1acef9785bb2b9cbb0fdec84
       git checkout -b v4_20220228_gitgitgadget_gmail_com dab1b7905d0b295f1acef9785bb2b9cbb0fdec84
```

However, v4 of that series doesn't apply cleanly on dab1b79, and if we
check the actual v4 message we see that it has a new base-commit of
74cc1aa55f30ed76424a0e7226ab519aa6265061.


Thanks,
Josh
