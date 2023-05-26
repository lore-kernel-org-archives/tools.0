Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F67115BD
	for <tools@linux.kernel.org>; Fri, 26 May 2023 18:11:24 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-75b01b0c712so136153685a.3
        for <tools@linux.kernel.org>; Fri, 26 May 2023 11:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685124683; x=1687716683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6wlA17DLjr9rwOt6b77R0USUmReYbPCyXFZA9TWOQZc=;
        b=Lm1e8d5ena9gnBQbM93TI24ab+hLhobPLpleirqaH3gcRsZqkvXU8Vi2XthXDJiHS3
         7Kn8kAaxBzQGHGV9S/pUNhthYOz5Wk1iJSazgOWnSl/S/VITPcgWtPIH2s7DRr0kuAHZ
         fwgnnraYihzAH7LC1MmPA0xhtjsVP+0y8nItI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685124683; x=1687716683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wlA17DLjr9rwOt6b77R0USUmReYbPCyXFZA9TWOQZc=;
        b=AuR7tSqhiGLEcg8IrnVXOMXW7FDDh4K8ua74eub8V3sxp0y5b0rcjPk7d70TrSTvI4
         3Qlch6QlpX4Xn1bjmIPOJPoIRhF6k6nxXIoq8NVEUTFYqHFPMmhKu4pzvKvUyIgr61M4
         TgdLiJ3zytc88bfrq4GjZ/KXOCLoAoMuvy8/IO3+BI4AQ0UT1HiPwMIpWDOLXFDWIG4l
         /a0uf7ytTjWrkYazs175St/D1bkzDiCswX3jX7uYx6nHDs8cs3o3wdEPUxQ7GTQjL4ly
         tMacocMtjGAqJpEhsgKADI3lQLOkzfUiz93AglJrLWLl8eUKWVro2m/UCwHYP3loRdtC
         5U1A==
X-Gm-Message-State: AC+VfDyvbrW1N5NvmAtYhK24pNcZ60gOvhTup935cmnmkx53XG/SJe9t
	SnxOPx4I3jmzE2KRD8pBy6evq3C6mLNUR/ZSOmQ=
X-Google-Smtp-Source: ACHHUZ5Q6tzRf0wxMyBK98cg5OC7ihdfFNKRATQsH6WluBqVYXTX/NohYZzoZqTbNAn7J8MteKg8+A==
X-Received: by 2002:a05:620a:4048:b0:75b:23a0:de88 with SMTP id i8-20020a05620a404800b0075b23a0de88mr505248qko.6.1685124682961;
        Fri, 26 May 2023 11:11:22 -0700 (PDT)
Received: from nitro.local ([204.48.92.234])
        by smtp.gmail.com with ESMTPSA id o26-20020a05620a111a00b00757888bbda2sm1324401qkk.112.2023.05.26.11.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 11:11:22 -0700 (PDT)
Date: Fri, 26 May 2023 14:11:20 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@linux.kernel.org>, 
	Dominique Martinet <asmadeus@codewreck.org>
Subject: Re: [PATCH b4] b4.sh: keep existing PYTHONPATH if set
Message-ID: <20230526-hall-hectic-stomp-37578f@meerkat>
References: <20230402-wrapper-keep-pythonpath-v1-1-e2bc5e556a67@codewreck.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230402-wrapper-keep-pythonpath-v1-1-e2bc5e556a67@codewreck.org>


On Sun, 02 Apr 2023 12:24:49 +0900, Dominique Martinet wrote:
> for setups depending on PYTHONPATH being set to provide dependencies
> e.g. requests, b4.sh overriding of the variable is too strong.
> 
> Set current directory and patatt's first but keep PYTHONPATH if it was
> not empty.
> 
> While we are here, remove useless use of env: the shell does the job
> just fine if the variable is set before exec
> 
> [...]

Applied, thanks!

[1/1] b4.sh: keep existing PYTHONPATH if set
      commit: bf2bb043b60cd8907f144a2d646c799c882ec711

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
