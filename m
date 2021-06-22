Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDB171
	for <tools@linux.kernel.org>; Tue, 22 Jun 2021 19:15:50 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id f16so109849qvs.7
        for <tools@linux.kernel.org>; Tue, 22 Jun 2021 12:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0UKv5gTjEWuXvX9GpcOS6cHs01S3atIhZXas8zSXaRE=;
        b=LoqIwxI28b+BFX8cpC0FvbGn0QivMCGTQu7g6jGCQdG7Co2KJGn3F05+Zm4dX5J7B8
         pAo91LsKb2F1S71JBOB5pkDggMTirUWPgPMbtUv5h1EQf4nDTvxfu3WRT5jHwR3WFDf+
         2FicR4krLQg3LZrxE+hrQJFmOKhfCDgxTXNUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0UKv5gTjEWuXvX9GpcOS6cHs01S3atIhZXas8zSXaRE=;
        b=V0PlFdlNjchBLgGeKNRu02O6HH0FK+UGTf6Rr6a5nsupBeELEhFuMKiKIpsiM7P787
         bF4phzHaY2+zTNDO22sTKV2AFQJxxeUeR1DKB0vV2MyFnvzwefULP7jF6cdpTKREdgAW
         GzghJq8KxTLMv/JtEFWYX6fpvlrp/99g9Dt8l3w5khFTXXyZPaS3clnbbwDmE5tTmU+U
         fr/AQUxbofC/Kv238CzrJNlLb+I/a5dKSVuHTRQeAZphhOZ4YBGf/6UHr5eZawpP6fuL
         PJx3NYtcTXxE5z4niUCxy4WLr4lK3SSiPV4FJlNO/T5xr7e1yazqgjnehYIDJfizOLYr
         AKBw==
X-Gm-Message-State: AOAM532AAoF2qTM9BOZtSIB1AWA+hjYjYkbZ3gLsdBV6N7TX7jmSbJvj
	M+aR2P3n5Lfh68e7KVfUd9Cjuw==
X-Google-Smtp-Source: ABdhPJx6WPZYKlOkNsCu/tXwcklBzuCb4QXFoLR756Aq18CaNbqpsYT2wcFICNNpPBeqXn/vw4Qkpw==
X-Received: by 2002:a0c:eb8d:: with SMTP id x13mr310221qvo.5.1624389349976;
        Tue, 22 Jun 2021 12:15:49 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id t8sm2226733qtp.7.2021.06.22.12.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 12:15:49 -0700 (PDT)
Date: Tue, 22 Jun 2021 15:15:48 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH] Allow '.git' to be a file for worktrees
Message-ID: <162438932152.941676.10970843778593198429.b4-ty@linuxfoundation.org>
References: <20210621204335.1627303-1-robh@kernel.org>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210621204335.1627303-1-robh@kernel.org>

On Mon, 21 Jun 2021 14:43:35 -0600, Rob Herring wrote:
> With multiple git worktrees, '.git' can be a file pointing to the real
> '.git' directory, so the current check for a directory is too strict.

Applied, thanks!

[1/1] Allow '.git' to be a file for worktrees
      commit: c0dd194bdd9318107d187878a7a3b21c6eaf9b3b

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
