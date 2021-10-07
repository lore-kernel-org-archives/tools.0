Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C5E2C80
	for <tools@linux.kernel.org>; Thu,  7 Oct 2021 17:38:56 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id p4so6773850qki.3
        for <tools@linux.kernel.org>; Thu, 07 Oct 2021 10:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0b5K6CHksAQREdd4KXJtzbRpoWGa8fxbeBueOTEc7wE=;
        b=eSYR0wPHzOkCeFzqO1djjGzA3EgPRBjKHnUep6wjJYlda1ZONuuZjIlBaY8sO5UuKE
         ZSky8WFkSdMvEehohwQTOrnXhL4r2XOYAHZo3IdL/wkAiJu17wEFeq5lYfIz5CiXrDVX
         g5R2ZJQliTbqVk4Piyvuhhcjhj4BwIqbggGxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0b5K6CHksAQREdd4KXJtzbRpoWGa8fxbeBueOTEc7wE=;
        b=DE5NiZPTegmHB8pdDe4UrUn1dEnxTL2S/jO7tosmgC/OaDJScVLXL81vAcTMl5ndxr
         t6ZyS2mU29e/iMrTbP+0enaKjsTacBtKQ4J9lxgU+Y07r4WWv0S8brUtCDxm0mLm5Pzf
         Rdirt0ReUU/t9Biw/at2H0fOYieQ8/jVqx76iEixpyGEQ+tMN4zUnb3t1ZbsVfw4AX50
         jIU/89VQwngYU8ujXQoJiH2pXMW5wTrhOmK3Q1W8hJy0CngDkXwa7orDQNHDa9CK7Lpv
         QjKWMhpGHRKjPOW9Mt45r0vZZDfyg0adnxf3zWvp86l5HhKEtAxAhpiHcNH0OXCIkcqk
         XH/A==
X-Gm-Message-State: AOAM531Z/U+BLQgda0/gGRDMsm0gpXPzlRARqJXf6CbvqItrU7psDsQI
	yZibDDu7U8+G3B1pZZoScuz9ABjGoTRIEg==
X-Google-Smtp-Source: ABdhPJyIhj0vdfOX5HaqF9ZtkV2/dRpsDiTQZxiUBRGQrHo2A226ZcuSWVklncIQOU6bsNtoOwCNnQ==
X-Received: by 2002:a37:c12:: with SMTP id 18mr4424969qkm.12.1633628335754;
        Thu, 07 Oct 2021 10:38:55 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id d17sm29498qte.0.2021.10.07.10.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 10:38:55 -0700 (PDT)
Date: Thu, 7 Oct 2021 13:38:54 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: tools@linux.kernel.org
Subject: b4 and git am -s errors (was Re: [PATCH 1/2] ext4: docs: switch away
 from list-table)
Message-ID: <20211007173854.v6wy6cpekbv3lf2i@meerkat.local>
References: <20210902220854.198850-1-corbet@lwn.net>
 <20210902220854.198850-2-corbet@lwn.net>
 <20210916095455.GE10610@quack2.suse.cz>
 <877df9tt5d.fsf@meer.lwn.net>
 <YV8EGFcPtM9u+ihl@mit.edu>
 <87wnmozy9i.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87wnmozy9i.fsf@meer.lwn.net>

On Thu, Oct 07, 2021 at 08:48:41AM -0600, Jonathan Corbet wrote:
> Ah...I learned something today.  If you try to apply your own patches
> with "git am -s" (via b4 to lazily grab Jan's Reviewed-by tags), it
> fails, complaining about duplicate signoff lines.  I'd failed to notice
> that before.  I've *really* applied them this time (and tweaked my
> scripts :).

Butting myself into the conversation in a totally non-creepy all-seeing way.

Was that when using "git am" directly, or via "b4 shazam"?

-K
