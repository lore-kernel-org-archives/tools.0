Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E79C6D0D
	for <tools@linux.kernel.org>; Tue, 13 Apr 2021 21:04:51 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id c123so14529953qke.1
        for <tools@linux.kernel.org>; Tue, 13 Apr 2021 14:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=DsIRuCMTkyDb2vVPYhluJ1icQ3bhTmlj3npskllzDxc=;
        b=Pbz2XoWcql8/d9g3haSoKj7gRngUWW7CLaduhFicmUJ8cxRjALsZsc6fL+TdTffpzd
         aFeF6Mm02jnDomvk2pJUjhP0vLVdJJ2i2GdYNiXLHXxjvSoy38YMr7zn6vStz+2vQku4
         dCp4bh886ruAOwdiHOVSJNud1ms6uima21LT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=DsIRuCMTkyDb2vVPYhluJ1icQ3bhTmlj3npskllzDxc=;
        b=dmGS5H0qUZpnxBiaLkRQO2L+Y3Ob1H/SuBsn2BQByxZhWoUUOhmxvrrL56vp90nkTc
         csOZcu2ixcz4oAZrhWU+/IIir6JZWSqc+oqoYFtkdj8POER4Idp+EC5VqUny/Si6lwQh
         J+fiWQF3PuCamuQdWsCiVh8iVLY9CuKW4rBpO0R191yGT+J+y80mXxgT/GQPxwqbToER
         ZsYzFlJ2TA9DJaYwON6QatzlHGpzn88g/oygY7MN2SuMD/NeuYuO/hbTPUTQnzZvq34q
         PoPwEhROP71L9myAbsMVeDTauF/dlLT6qoqw55ZhIiBZmVC1l06+m6/HmBnygmo0ADRW
         dQTw==
X-Gm-Message-State: AOAM531DeIP5tonu14PAjEex6Y+FrJTBT6z3/QNgMew41+nYbpyV0Z+X
	vqgE/8PB7yogNTH0x0CnL4+u5Q==
X-Google-Smtp-Source: ABdhPJzycuZxNxBW29F6HCdfUYT8hrrYda7SPAKop9u3OH3TTZg6N3/t7MMc6vUfnmzKiNP1HmYE+Q==
X-Received: by 2002:a37:6c2:: with SMTP id 185mr11152211qkg.228.1618347890618;
        Tue, 13 Apr 2021 14:04:50 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id z6sm10830787qkc.73.2021.04.13.14.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 14:04:50 -0700 (PDT)
Date: Tue, 13 Apr 2021 17:04:48 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Alex Elder <elder@ieee.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: RFC: Superseded-by: follow-up trailer
Message-ID: <20210413210448.y5v6dcgxlmnz2wy7@nitro.local>
Mail-Followup-To: Alex Elder <elder@ieee.org>, users@linux.kernel.org,
	tools@linux.kernel.org
References: <20210413204932.yovoa7njwc56jo5v@nitro.local>
 <fd732fc9-83a9-5502-fba5-f08317bdcaf3@ieee.org>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fd732fc9-83a9-5502-fba5-f08317bdcaf3@ieee.org>

On Tue, Apr 13, 2021 at 03:53:50PM -0500, Alex Elder wrote:
> > I would like to propose a "Superseded-by" follow-up trailer to help strengthen
> > the link between series revisions. The trailer needs to be sent as a follow-up
> > to the cover letter or first patch of the previous series.
> > 
> >      Superseded-by: [url-ending-with/message-id-of-next-version]
> 
> Could "Supercedes: [url]" posted with the new version work?	-Alex

It doesn't achieve quite what we want -- specifically, a way to indicate to
someone that the patch series they have retrieved has an updated version.

E.g. if someone uses "b4 am" to retrieve a patch series, they wouldn't know
that there's an updated version -- we try to check for it by searching
lore.kernel.org based on subject + author, but this is a weak check.

If we only used the "Supersedes:" (or Link: [url] # v2) in newer revisions,
we'd have to already be aware of their existence. Patchwork can possibly do
this, since it parses all content, but b4 cannot, since it works within the
confines of a single thread.

-K
