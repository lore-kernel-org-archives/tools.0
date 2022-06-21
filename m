Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E57910E4
	for <tools@linux.kernel.org>; Tue, 21 Jun 2022 15:29:06 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id y14so15561564qvs.10
        for <tools@linux.kernel.org>; Tue, 21 Jun 2022 08:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=21aw1rRG8NUc1PcYxgOG72fJELPiyx94bUCulWvA1aY=;
        b=MwD3CiiNkfSVrawGID40RhYaPR5xRs/IXknLBJ9pkWEuV85J2CqKsZtDkG5Z7frQAm
         L6YHZG0fd3zQYtqmF7HWkBAvW7FzULQs3YFP64EAP/ijhI3/cRj30HT1GNgY7Vlp+Hso
         z/5y6rH++zm0ENXyXT8mvbCN84DNh0NajLsm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=21aw1rRG8NUc1PcYxgOG72fJELPiyx94bUCulWvA1aY=;
        b=Z7hUPbfhpnysBSEIlNvzNdRDXFsB2qsXqgxIZWkK6tLGpXtu0D9DEH3u+VJX6wycq4
         /SgHuCz/++O+9W0PBL+hGDrjIYLw5ikLy4QrkrQxHf8/SGUqiJYL5NQQt5vh6Plf7/oH
         Y7c25++r7oNLATd0Lx8VGaPKg3FDYqonw8rZ6F38iHipu6hqPbOs/XkO0aeKHkRve2N/
         MVbH3AiHJJO63UDfNnamDaDLoNukT05gMMuizTU3dVVuK1B5ifRDQ1r/j1KNdOBlZGaQ
         NAY0jS2Gyve6z3TYu/UZN8YdRoKR4GVyGM6w0csDfvtLAgzlnWpubpHWMi8+oovJq4hR
         OZlw==
X-Gm-Message-State: AJIora8fXfeg8ETHaVW9MGcqj9xGrmUkNcqyzcJeOw1zmB/zaSXQdaIH
	dC/lCjmQNfReg62+UE2NelESfUXoG0cUKw==
X-Google-Smtp-Source: AGRyM1vn4BVCs+UY2BUbu8fgtI2Asz4UOvFGfgRq9LkfB4CqQQouFzh2IhToAUvz9x4Dyzn7XuEb9g==
X-Received: by 2002:ac8:5984:0:b0:305:29a3:49fd with SMTP id e4-20020ac85984000000b0030529a349fdmr24815838qte.449.1655825345855;
        Tue, 21 Jun 2022 08:29:05 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id p13-20020a05622a048d00b00304dd83a9b1sm14236969qtx.82.2022.06.21.08.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 08:29:05 -0700 (PDT)
Date: Tue, 21 Jun 2022 11:29:03 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4-0.9.0 available
Message-ID: <20220621152903.czivp7fdn6me775i@meerkat.local>
References: <20220617190153.tvi5lkzlvemeqou5@meerkat.local>
 <CAMuHMdV4AHH1TM6xf26MP0-dUQ0-fB+62GeeuVuth9pgWgdu7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdV4AHH1TM6xf26MP0-dUQ0-fB+62GeeuVuth9pgWgdu7Q@mail.gmail.com>

On Tue, Jun 21, 2022 at 05:20:02PM +0200, Geert Uytterhoeven wrote:
> > 1. default mode that applies patches directly to your git repository, just
> >    like passing the .mbox file to git-am
> 
> I gave it a try, and noticed a difference: with b4 am + git am, the
> Link tag is added first, followed by my SoB, while b4 shazam does
> the reverse, and adds my SoB first.
> I believe the b4 am + git am behavior is correct.

I'm guessing you were adding the SoB with "git am -s" as opposed to letting b4
do it?

I'm not sure there's an established "correct" behaviour here, as various
maintainers either stick to arbitrary ordering, chain-of-custody ordering, or
have a very strict "I like all my trailers sorted in a very particular order"
approach.

I can swap the Link: and S-o-b: trailer order, or you can just turn off the
Link: trailer, since the latest recommendation is to restrict them to merge
commits.

-K
