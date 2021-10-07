Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A552C80
	for <tools@linux.kernel.org>; Thu,  7 Oct 2021 18:10:25 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id j12so4702871qvk.12
        for <tools@linux.kernel.org>; Thu, 07 Oct 2021 11:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=T65YulvoEqtKPNm/CceAV9GOMpxlfuxx49ERyJnM9WU=;
        b=gX6DeGRrPs74WsJRnaY8tc52ZyQOtSfn5JEbqQaHTEYOwiODYSGPBLRn3790VmKD8O
         xkvSVng8oaWZ5F9raZV+hmF+EAaooUXO4vADCsssBM0NIgHgALVs4LutUVh2R2KZhKst
         qcRvAPFdAY6zPZI3rSE6tGrxalYbqUsO2hNhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T65YulvoEqtKPNm/CceAV9GOMpxlfuxx49ERyJnM9WU=;
        b=bn5OhgKzp4a32Yn7OW2H0MvSPmLeLqT5zLs81C9YrAxJyC+EJwgPOFx3HMenI5dukX
         LK6FRCXmWusTtc67o6As45ODHzVjG2dVn0shcwuCQTeX0dfz8nJrTDj3KggIlUH2eKVa
         UkA1IyQPLX9pg0vXAsgLZ1YvZBqjqOrum4XFrkoakxoYUBNIh0CebZIBGbKLG251na6m
         aqcLc0Tq4hvTgj6XWlHqzsro32z83O09I9JLs3IRpPVOooZjdMPdHTw3Ov0yANPOZ1AL
         iEGXZSpcnTs1RbK3zt0x55yte5F2YgkcEaF+8oDhNg2GlbqAfS6SkueO8RQJKVCAaZKM
         Wo+w==
X-Gm-Message-State: AOAM532CWihxzzpAEw1VRGKhWUR3TbzYA/7VXT+hZtxZikZmUdob+f+I
	gVpDchQxryk19kGLDb8ME3cWzA==
X-Google-Smtp-Source: ABdhPJzPdpeXRuGzmc3PvNOBHIyzq2zSEvcClT8snEQca0UbXs5tt8Iabu4OVduyQePLWK9LN+4iEg==
X-Received: by 2002:a05:6214:1710:: with SMTP id db16mr5549631qvb.1.1633630224746;
        Thu, 07 Oct 2021 11:10:24 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id v8sm105983qta.21.2021.10.07.11.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 11:10:24 -0700 (PDT)
Date: Thu, 7 Oct 2021 14:10:22 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Kees Cook <keescook@chromium.org>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH] gnupg: Add gpg status output to debug logging
Message-ID: <163363017951.585602.10034547196331638322.b4-ty@linuxfoundation.org>
References: <20211007165801.2313136-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211007165801.2313136-1-keescook@chromium.org>

On Thu, 7 Oct 2021 09:58:01 -0700, Kees Cook wrote:
> There wasn't an easy way to see how a failure was being determined by
> GPG, so add the entire GPG status output to the debug log.
> 
> 

Applied with minor stylistic changes to both main and stable-0.4.y,
thanks!

[1/1] gnupg: Add gpg status output to debug logging
      commit: a7ec0c10429bb1e14591e33c08baf3aee28c26dd

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
