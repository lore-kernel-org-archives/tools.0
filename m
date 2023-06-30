Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC76F168A4
	for <tools@linux.kernel.org>; Fri, 30 Jun 2023 16:07:34 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-401e23045beso15566561cf.0
        for <tools@linux.kernel.org>; Fri, 30 Jun 2023 09:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1688141253; x=1690733253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I8V0y+ctQYzY9VRKvMZYFOzAX+P0PXLJGN9ewhOFczY=;
        b=OJM5dCu7V86JcHprXFJvoKxSrsN0L/vEeEgePFKo/ODcQfFxeoNoCvpuUkoX4foSEA
         gAZb4XDTVqDsJV6K93sk1UF7EpTir4hN13DoZ0QcV0F5LriUevF6EtClR1D5g8NUs0XP
         UPuiWZZ5s1+GbgH572FPvW+NKF4qRCb4hkpQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688141253; x=1690733253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8V0y+ctQYzY9VRKvMZYFOzAX+P0PXLJGN9ewhOFczY=;
        b=Y1k2B7OZAxhfLoaG7WvYN67J+IQILUZ865vUR5MfvVZPl3We4dDLfq09iQCQ6iKm0Q
         Fhl1+S2cv8GYMauRafFrUL4CyCmtmrfHI2Z2CmOe6dKf77v0sgnvcKCjjNxQeZxnOV0t
         0FVsu2nrJIYE82hyZY1t20rSqu7drACbstv7CwU5WKorF06NkT/i/Cpp9YohYrn4XYsS
         T4AjxxO8VxK1FSeeRR4QXa5JcWbC7KIsbBgFMkfcGBc/aq0Yv1dangp2O4JcrvXOf8g+
         O7wzZT8+dPMJUCLrAdqGhQnnXIZ7lZcIi/pABVaYWvMs3QBkrjCCZk23shjrKhbhImaK
         O7HQ==
X-Gm-Message-State: ABy/qLb2Fa4Vy12mUkl61TXLkjrUv9QKKQZGgn3J8FBxviqPHeXWLK3q
	1tf/rqGhtmwjY1gsGAmAbYMk6VZCQMbRQ6AvhcE=
X-Google-Smtp-Source: APBJJlHuzAvN7gub9FaDYqc7WhMZSzDOFRQKTIr3ZTJ3zalsuBQuHXMv5f5p0QXb2NeiND4pj4kSQQ==
X-Received: by 2002:a0c:efc6:0:b0:621:33a2:4a3b with SMTP id a6-20020a0cefc6000000b0062133a24a3bmr2641647qvt.48.1688141253454;
        Fri, 30 Jun 2023 09:07:33 -0700 (PDT)
Received: from nitro.local ([209.226.106.132])
        by smtp.gmail.com with ESMTPSA id l15-20020ad4444f000000b0062439f05b87sm8092013qvt.45.2023.06.30.09.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:07:32 -0700 (PDT)
Date: Fri, 30 Jun 2023 12:07:24 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Erik Schilling <erik.schilling@linaro.org>
Cc: tools@linux.kernel.org
Subject: Re: [b4] Allow sending prefixes before [PATCH]
Message-ID: <20230630-shall-whips-conch-5f06f7@meerkat>
References: <CTPW75Q2ISUN.251ELTNP6RB22@fedora>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CTPW75Q2ISUN.251ELTNP6RB22@fedora>

On Fri, Jun 30, 2023 at 11:54:36AM +0200, Erik Schilling wrote:
> libgpiod wants patches to be sent as [libgpiod][PATCH ...] [1]. However,
> b4 always sends [PATCH libgpiod ...]. I found no config switch to change
> that.

Because it's wrong[tm]. :)

> Maybe one could differ between prefixes and tags? Then prefixes could
> be a _real_ prefix and a tag could be within the square brackets as
> described by the docs [2]?

I'll think about adding a way to do this.

-K
