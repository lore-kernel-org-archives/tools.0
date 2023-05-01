Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC35128F3
	for <tools@linux.kernel.org>; Mon,  1 May 2023 15:37:54 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-3ef112cab37so24844761cf.0
        for <tools@linux.kernel.org>; Mon, 01 May 2023 08:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1682955474; x=1685547474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqNOZRs3hZ2oCyThAyvuR+6upu09GvWwt4KIL1TozTU=;
        b=Kr6Vx7NJ1GDHZjUWGkGCbjT2v9wEZSMiOAd+jvSxkuIYLs9lVYyopoNxMwQ9jAk2Ys
         Iwnlcdn7SgotTihBAVhwKFlEjcjnGJfBrRZNhc3Y4DG/hiFBligipDjGsKS/Y4qMMAAo
         QTOjA0gw8KRshmwAVMRk/U10j+1MJM2/IdObY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682955474; x=1685547474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqNOZRs3hZ2oCyThAyvuR+6upu09GvWwt4KIL1TozTU=;
        b=Mqm1uu8OjZNivtyriPbCKTRkXZEzl4RYgDijjFwb09umjH5lAwxge4dt/3y2Ukyiw+
         EbiL5CpvD5ayrkBfpRWrxNrdCUa5OEdXp0PkQvRXr9M3W8xkrKiyuX8kxqDVHrSNbWan
         BxQWvdvbtmR8dWTWqUOh1cRh+PQJs2F3HPbxY6vQG59IFmMohCow0zCdV9iSlM95+T31
         VCFFQr1+KyQ6wk/YzdtmsjWTf65ro5kfYkzhjrMj2xV4GIF5GSYaLQvVd0VePNXJWNxM
         C1+OYa9NMTZUPvZTQT2sU/Epop3w1z/JhfbK7qmXFdzaJWimup9MXIcLP2sdsoAhXZwP
         PdHQ==
X-Gm-Message-State: AC+VfDxfD8/GanBuHP7rymbz3x07RfPhQOsbMYsP8FPdj5aUgKIaOLPN
	x767O2dYgsGCGRnSl0DVSsMjVQ==
X-Google-Smtp-Source: ACHHUZ6eMTzmMOCHY6QITAEy9fVKIMnBmq9NcWtYxe/7c/Yf3g2nEz66pEky/4WnDny7LCHy78WNrQ==
X-Received: by 2002:a05:622a:1189:b0:3ef:6415:90ed with SMTP id m9-20020a05622a118900b003ef641590edmr23357573qtk.65.1682955473802;
        Mon, 01 May 2023 08:37:53 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id n138-20020a374090000000b0074d930f4076sm8908504qka.135.2023.05.01.08.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 08:37:53 -0700 (PDT)
Date: Mon, 1 May 2023 11:37:51 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: Unhelpful cover letter default for single patch serieses
Message-ID: <20230501-eleven-although-4cf5a4@meerkat>
References: <ZEwRJqjvbZGqpZpg@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZEwRJqjvbZGqpZpg@sirena.org.uk>

On Fri, Apr 28, 2023 at 07:32:06PM +0100, Mark Brown wrote:
> When creating single patch serieses I repeately get tripped up by the
> default cover letter behaviour with EDITME.  I run
> 
> 	b4 prep <make a new branch>
> 	<make kernel do thing>
> 	b4 prep --auto-to-cc
> 
> see that --auto-to-cc did what I wanted then run my CI only to have b4
> send fail afterwards due to the EDITMEs left in the cover letter which I
> never saw since I don't want a cover for a single patch series and
> --auto-to-cc did the right thing.

I'll think of something for single-patch series.

bugbot assign to me

-K
