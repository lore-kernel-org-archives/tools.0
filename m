Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040112F59;
	Tue,  4 Oct 2022 19:03:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4201C433C1;
	Tue,  4 Oct 2022 19:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664910201;
	bh=DTg6h0bm2axK+aknujnjID+4bgdQmzcuE/tdAE7GiSc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XYR6+UCvhCD00wXXvkykp4DX23d6Q+GeDdGs7mcpEBvywZyDgNYsXRw5H9XWl03A/
	 +SSav0hwZcebZgavd44u6ZcoqUuQwtxdb5ivY1hohE29KJN4HqlKYUnmS32tlDpV+U
	 zW/IZR50tXOWbiUcKx3LOW/Dd3PbUjjJ6CXTtKiHF3M+UsH3rSexhCmaJAHfyNB4CB
	 i88AuvY3z+yKiXXsPTtB2gf/GWLS1PQ3Iw6NOMNVfwivo8lncQySxMrHWR+ctQ9qKP
	 9owSbjwTJOjNKRydaN0tpuaRMepIyvbNwbE/q4XSxFfbZtlHBXmzGpvRblXoE3mGPs
	 ORaVhlyW2ATlw==
Received: by mail-vs1-f52.google.com with SMTP id q9so2840087vsp.1;
        Tue, 04 Oct 2022 12:03:21 -0700 (PDT)
X-Gm-Message-State: ACrzQf3BlqlJ+gYWTV9qp2Ccv+2s4fJsbmm4mpdY5E9hcO1xQOHX9bDQ
	ZHx2tMM+vnM+MbyRRn/DAfnLVwfT9ptpEu3ZnA==
X-Google-Smtp-Source: AMsMyM6fBwQA35rQUcJHhKHgOjcOZF+6inQYmbJEIRPIQTQ4gwFRiY+1lNcpDxXE4OQFLG0/LyMcmZUP/o6R9dSLBiE=
X-Received: by 2002:a05:6102:3fa7:b0:3a6:72a4:3188 with SMTP id
 o39-20020a0561023fa700b003a672a43188mr5897996vsv.0.1664910200499; Tue, 04 Oct
 2022 12:03:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20220926172903.f3mudqmts5woudll@meerkat.local>
In-Reply-To: <20220926172903.f3mudqmts5woudll@meerkat.local>
From: Rob Herring <robh@kernel.org>
Date: Tue, 4 Oct 2022 14:03:08 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJVY5Mk0e+wLXQBJnY0OwR=vh24MhqTqmaozBjaBAULKQ@mail.gmail.com>
Message-ID: <CAL_JsqJVY5Mk0e+wLXQBJnY0OwR=vh24MhqTqmaozBjaBAULKQ@mail.gmail.com>
Subject: Re: b4 v0.10.1 is available
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 26, 2022 at 12:29 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Hello:
>
> B4 version 0.10.1 is now available. This release contains the following
> changes compared to 0.10.0 (among other minor improvements):
>
> - Fixes the crash with "b4 ty" when using a local binary to send mail, and
>   generally improves the [sendemail] configuration section compatibility
> - The "send" and "prep" commands now properly include diffstats into generated
>   patches
> - Does not force single-patch series to have a cover letter. The contents of
>   the cover letter are now appended to the basement section of the patch.
> - Does not force "v1" to be added to the prefixes
>
> For upgrading instructions, please see docs:
> https://b4.docs.kernel.org/en/stable-0.10.y/installing.html
>
> Special thanks to the following people for the testing and bugreports:

I found a couple of issues with trailers and send. I'm on the current master.

In 'b4 trailers', if the patch id doesn't match exactly and it finds
some trailers, b4 just prints 'No trailer updates found.' which is
misleading. Can it have a fallback to subject matching or at least
print when there isn't an exact match and list the trailers found.
It's quite common to either have minor changes (and a judgement call
on whether tags still apply) or a review that's 'With X fixed,
Reviewed-by: ...".

The 2nd issue is with 'b4 send' and seems to have been introduced
recently. I have a commit msg like this:
"
Some commit

Signed-off-by: ...
---
 v2: https://lore.kernel.org/all/20220909204509.2169512-1-robh@kernel.org/
   - Rework YACC code to handle configN formats in C code
   - Add a warning when an unknown configN attr is found
"

I'm putting '---' in the commit to store the changes for the commit.
The patch ends up with 2 '---' lines, but git drops everything after
the first one. The issue is that
'//lore.kernel.org/all/20220909204509.2169512-1-robh@kernel.org/' is
added to the Cc list.

Rob
