Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0B82C88
	for <tools@linux.kernel.org>; Thu,  7 Oct 2021 19:18:37 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id c20so7300924qtb.2
        for <tools@linux.kernel.org>; Thu, 07 Oct 2021 12:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1KDx873YIOv2BFKn0ejQQxFO9S75ZZ6LwoT8CwAKaDs=;
        b=Z8UgTzIH3ufwEj0msyrabU34NYrlXH2QSecnB6ZaBJu8378og6MKNTYKBFFZ3XJ89h
         uZ2QXRlLE3OhQ3xVFHo4OEc7SzRFOinHMfFzxYVN8FntOOcdDx4Iglsix9zNG4N6egVh
         fY5niwaA6GmxXD1UU+G1TJkAdYds0j0B4IZfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1KDx873YIOv2BFKn0ejQQxFO9S75ZZ6LwoT8CwAKaDs=;
        b=Ph7MKifuF6S+SHShjE6VCNzLa+sAZ5iPl0AIIlOgNmu7K/k0xuA6S/hJdXrUc1SWog
         L0INH8m9uxOPR+ux8B+3JkpEMpkSh2GtBGSoQ6HiuEjEOfUxAtAxJVrI3483sOfGo6Fc
         FobtnkkzQF6T+s7RuD2RwS4irKRo9UGJgT6kz+5WaVyqjGK3+L72dPQAjQ3EnLBR+Q/P
         8qCzA0M4y//fL0KR1PXxycJ++SxG7V5eANr5JPOCvrtszJfrfJVcRgo35Z1kLN9tHC75
         ET50otAyZBq/NEDTCvCDUKmqlhadBMVOJlO7Lj7zPyn/DgyfRkegw5hHEhZUDtJI0kbr
         wVww==
X-Gm-Message-State: AOAM530xTVmnWF9Z470wYOM6wgdxLoZZkcnYjiZLqIaxPUYlqLqrLfRx
	vnpNflmSF8msSAxzGN8PQuXu6TiV+RWs0Q==
X-Google-Smtp-Source: ABdhPJyad3HOYIPn1fTMncp5U/mp6xOn/jU3jhp8eVWu41rNwUWu/9cUbUSzKzfW4A6wK6JLJCIgeQ==
X-Received: by 2002:ac8:7b48:: with SMTP id m8mr7011304qtu.133.1633634316132;
        Thu, 07 Oct 2021 12:18:36 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id g5sm232893qkp.120.2021.10.07.12.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 12:18:35 -0700 (PDT)
Date: Thu, 7 Oct 2021 15:18:34 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: tools@linux.kernel.org
Subject: Re: b4 and git am -s errors (was Re: [PATCH 1/2] ext4: docs: switch
 away from list-table)
Message-ID: <20211007191834.z2itkntlll3lixhh@meerkat.local>
References: <20210902220854.198850-1-corbet@lwn.net>
 <20210902220854.198850-2-corbet@lwn.net>
 <20210916095455.GE10610@quack2.suse.cz>
 <877df9tt5d.fsf@meer.lwn.net>
 <YV8EGFcPtM9u+ihl@mit.edu>
 <87wnmozy9i.fsf@meer.lwn.net>
 <20211007173854.v6wy6cpekbv3lf2i@meerkat.local>
 <87o880zp4n.fsf@meer.lwn.net>
 <20211007182257.tj6vrjgfusizv3ml@meerkat.local>
 <87fstczm40.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87fstczm40.fsf@meer.lwn.net>

On Thu, Oct 07, 2021 at 01:11:11PM -0600, Jonathan Corbet wrote:
>   b4 am -o ~/tmp -n am -c -t 20210902220854.198850-1-corbet@lwn.net
>   git am -a ~/tmp/am.mbx
> 
> ...and that prints "Duplicate Signed-off-by lines." and leaves the repo
> in the "in the middle of an am session" state.

Ah, looks like you have .git/hooks/commit-msg -- the default one will check
for duplicate S-o-b lines.

Not much I can do here, I'm afraid, but thanks for helping me trace what's
going on.

-K
