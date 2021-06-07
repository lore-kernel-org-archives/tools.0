Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDCB29CA
	for <tools@linux.kernel.org>; Mon,  7 Jun 2021 12:52:02 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id im10so7857619qvb.3
        for <tools@linux.kernel.org>; Mon, 07 Jun 2021 05:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5uKA7FBhnN9mO7HXyMMbmyoEKxIhPhq9xBmdLJHakBw=;
        b=ZyThm9ZuaRcBOWoq86mMAQ+4zBP5GLpMJWFvi3/voLiqSLgDDNYVhGfuU5I54r62fw
         GxRFqFt3v9qq+wLoQjzp5jjVIkdi2G+LX+p0K6L/6vPICW2XR2WGcnWRoBOo+mz1o1dx
         d1CguR3Qx2Rg6Xs6PZ9AgCUmupAMDq4YelQAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5uKA7FBhnN9mO7HXyMMbmyoEKxIhPhq9xBmdLJHakBw=;
        b=SFNdp6wonXXKH2DfV5J91g9fyxkX+al4WIEcKRPfSpcOFGcBdEmhhpOVeeRtIuCVOA
         poimTHL9HPvgMAwmmNIf6o6tXMHCFvz5hshw8/dNOP9b8mWxGscar6I2UEyvZjpAMaGv
         38hTVcQKrDT4TGZKnmgWOvf4jfWDDAuWTuLJQnEWwXa7Bz/qj6JGznwXVcTIoJCII6vp
         /gIoSruMHRPjmhiiOd8NiH7bS5Q3lD3WWzhE7O1u9JQ15MVV/ZIULLTYULEJ22HRIxY4
         XHUu4lOro/vwaxR3xBQU5yBZZI36A0p5nX3Qcub0CgB9j0mbiTGi5ywzby+iW0virAVM
         IZdQ==
X-Gm-Message-State: AOAM533zbKJ7VHthMmn+Pa7awvqFPnh0XowUw19Pwuyl0CwEPTqqlduc
	7ox6RdAmMqM+VokeeD0y9eIYOVrNdpr+qp/SrzI=
X-Google-Smtp-Source: ABdhPJzTI/hapu0kv1eW8lNwZ8NnyfbL0vLM2uGHZ+LT+fuiFsmp0t4lcwjAF/8S/KGEzrUflvmd4Q==
X-Received: by 2002:a0c:e185:: with SMTP id p5mr17510628qvl.17.1623070320844;
        Mon, 07 Jun 2021 05:52:00 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id c77sm7335218qkg.81.2021.06.07.05.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 05:52:00 -0700 (PDT)
Date: Mon, 7 Jun 2021 08:51:58 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, Paul Barker <paul@pbarker.dev>
Subject: Re: [b4][PATCH 0/2] Improvements to DKIM signature verification
Message-ID: <162307026797.2170895.15758374531862168765.b4-ty@linuxfoundation.org>
References: <20210607100252.8253-1-paul@pbarker.dev>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210607100252.8253-1-paul@pbarker.dev>

On Mon, 7 Jun 2021 11:02:50 +0100, Paul Barker wrote:
> Testing 'b4 am' with patches sent via Office 365 to lists.sr.ht showed
> the same issues I found with patatt in handling re-encoded headers. So
> there's a patch here to fix this and a patch to improve the ability to
> investigate DKIM verification failures with debug output.
> [...]

Applied, thanks!

[1/2] Handle MIME encoded-word in DKIM-Signature headers
      commit: 366bcd1fd8a10b6125e591f0c35cc85b10c9c950
[2/2] Include dkim log output when -d/--debug argument is passed
      commit: 506cf91716ff32c3747829b8556ce2d26b1936a4

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
