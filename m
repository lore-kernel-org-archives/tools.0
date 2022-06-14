Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A8F1FC1
	for <tools@linux.kernel.org>; Tue, 14 Jun 2022 20:25:58 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id 89so7324522qvc.0
        for <tools@linux.kernel.org>; Tue, 14 Jun 2022 13:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ecdGaX1jtv7/UUE80xTW/gskhwhHBu41CiEDuz1s3qY=;
        b=GkU+OqBd6ff/R4sZbHuxxIzYJTZrgZmYDYVgkfDXY42eCCtGobvMQT/6Yblcut+m/T
         qZSlaV6J0LytnCNoU1SyVX3ToJAjpWu1Juc7xL6+COgDvUn3/nRVwWLuaeJWUt4C8nH/
         m0jPcQPI6EzmINh1DtjbHvTN6iBj23lQ9X2DE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ecdGaX1jtv7/UUE80xTW/gskhwhHBu41CiEDuz1s3qY=;
        b=JMPiOCEdUTMN3dG9cmAS+pwR+m4vIlI1tT1lTVJUJry0B7zg/qLWf4CsrRaQqP7oET
         kYCd171rPz/gdOJ3dY77DFmmk7/IpJu20TVVsK0Xt7qiUa2/0KQKfwTBKFSXLNYSKhxZ
         T22Upk0sZdpu38J6SmOuOqfpKgSJgCo2ATynFgJIxkTBHflvRYXIfiAAYZaTBRkJlzgf
         5nxFtdsfaF/KUUxPH67KLtgaA8mi2zKkVxIAggAtEIhTKtdAf44a3CT9spzBUmM8Rd/r
         Sortz+4e5HYGlXlnBTMOeDVRlktblDTJpytCGQAT5uyJWbo6w6A6AtZhf7uQzKoIPJpZ
         Rzjg==
X-Gm-Message-State: AJIora/iDhoYObxtEjpe+xnxagDW3FCPN4hWq9cs1wjHYFuQs9qed6/A
	zzwYn78bvLK8b74ChW0iTDq6xGFIEDez8w==
X-Google-Smtp-Source: AGRyM1sgvN79G6PT5Cyq+s5h6ySGrb01YsHQ3lbkJaDyv0pWnbwp8KhYhIxvGZaQTAt8/qEVHm0bFw==
X-Received: by 2002:a05:6214:508b:b0:467:de79:4f7d with SMTP id kk11-20020a056214508b00b00467de794f7dmr4867757qvb.101.1655238357711;
        Tue, 14 Jun 2022 13:25:57 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id j9-20020ae9c209000000b006a377a015d4sm9998631qkg.39.2022.06.14.13.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 13:25:55 -0700 (PDT)
Date: Tue, 14 Jun 2022 16:25:53 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: robh@kernel.org, tools@linux.kernel.org
Subject: Re: [PATCH] am: Fix broken guessbranch handling
Message-ID: <165523827762.24677.15302189224501428827.b4-ty@linuxfoundation.org>
References: <20220331195346.1384515-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220331195346.1384515-1-robh@kernel.org>

On Thu, 31 Mar 2022 14:53:46 -0500, Rob Herring wrote:
> b4's usage of git-log '--branches' option is broken. The option takes a
> glob pattern *only* and must have an '=', but b4 ends up passing
> '--branches <guessbranch>' to git-log. This will kind of work, but is
> not checking only 'guessbranch'. For example, these 3 commands all do
> something different:
> 
> git log -1 --branches=master
> 
> [...]

Applied, thanks!

[1/1] am: Fix broken guessbranch handling
      commit: c95e4d16d87c7c71589c64b1ac94973b354d0820

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
