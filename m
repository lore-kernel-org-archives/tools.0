Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552F228E1
	for <tools@linux.kernel.org>; Mon, 27 Feb 2023 20:47:04 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id nv15so5376755qvb.7
        for <tools@linux.kernel.org>; Mon, 27 Feb 2023 12:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gMnvWwSoGd4PQcOu6fceOPHYoPwyiaPpZ9TjdPqNhYE=;
        b=MduW/T3FQXmnpEeijeGDwxzI71cTfGCyuPytxKIJThGEPHvOn70647U+cLgtZxjlNw
         1BnatdjyEqfeXVsKvk8hKaqoC5rzOY+HaEziPxM7u4xb4YaY7CXBFJIoOir9ojIgYX87
         HkrFuRTewGURMdpU6mKEyu1gRxPHyVhXad/+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMnvWwSoGd4PQcOu6fceOPHYoPwyiaPpZ9TjdPqNhYE=;
        b=2rlYOgGTme0+NlZ20JnrM3UFeqfEPtbyNxrcKFGQ6oajGFcRriZYSNzpwc0U9QLnyU
         67BG1RX8SIhG+5oZbwdwz8IfuPlob5p8QW2+S73b73bUxAYVUUSTGjAJI4qUDGCWcgvg
         L2Mf3dpjxt9wP7O4bBALKcXdP3VA1DW+XfQQxOoE/m+0BslKPNX5nxu0nycjSoWbRXtw
         6YKO/7vhD5DRCWrjx8lu80O9oCoH/s0562aOHXfU2YcHH5G9f5RuOjuKRpij+ezIRngU
         2LUbAm76NnEVIMzMkAvQaT8OUzm5g2B1yN44zh2rtTfRkqjgVr5k8y1IvsNKxI6S9znD
         Qn1w==
X-Gm-Message-State: AO0yUKVZiBxnGvThuAjMV4pIoPEBru4X84fC/OpSDr67YgSlu24RPGz3
	ml7wVSdzo39ThLpG3CMqk4Th3MNUV4wYuJSc
X-Google-Smtp-Source: AK7set+PHgtufI1WaD9leQStq0L6jKi8B1bMQp4JoJ7Vb9ZZWgdUBb3wCoIr+JqL5JR38eZ9ooDSIA==
X-Received: by 2002:ad4:5d41:0:b0:574:8ef8:89cf with SMTP id jk1-20020ad45d41000000b005748ef889cfmr1740330qvb.12.1677530823131;
        Mon, 27 Feb 2023 12:47:03 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id q15-20020a05620a024f00b0073baa5ec0besm5528394qkn.115.2023.02.27.12.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 12:47:02 -0800 (PST)
Date: Mon, 27 Feb 2023 15:47:00 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH] shazam: Add the --add-message-id argument
Message-ID: <20230227204700.22iorqokdzy3tvkb@meerkat.local>
References: <20230227200930.qdynviatehu5i4br@meerkat.local>
 <mhng-d926c57f-ccbe-452c-a5a0-3861198c60ce@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <mhng-d926c57f-ccbe-452c-a5a0-3861198c60ce@palmer-ri-x1c9a>

On Mon, Feb 27, 2023 at 12:26:04PM -0800, Palmer Dabbelt wrote:
> > > Sure, but if someone else wants to take a whack then I'll be more than happy
> > > as it'll likely happen after the Linux merge window, QEMU soft freeze, and
> > > GCC branch...
> > 
> > I can make this change -- should be straightforward. Thanks for the
> > suggestion.
> 
> Awesome, thanks.  No rush on my end, I've still got a few other patches in
> the stack so I'll be running my local copy for a bit either way.

It's in master if you want to try it out. I ended up doing it slightly
differently, since we use linkmask in a couple of places, so you'll need to
set the following config variable in your QEMU repo:

[b4]
   linktrailermask = Message-ID: <%s>

-K
