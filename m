Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE37C7C;
	Fri, 24 Jun 2022 17:52:10 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id g4so5691061lfv.9;
        Fri, 24 Jun 2022 10:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aB8zojV5jEUefDuVJi0vR0YkG/U5cfNheMWVTqJjaIE=;
        b=Zx9ZkEdtBqZcC89T/7iIle8m7wx7s3HcXmQ+HDFgmJLyqzkw7ZDRVbH9WgdeSGpMcp
         BM9yEMAYH6+7eT27CZ5igFmS91KoHhV7Iqd32zjcwA9wUzSy5cnIi5F3P2HdmPK+wwQB
         csGelyrt7++xZy7H8i14mt5bDuJKUB8OvqzysjN8Y8NB2UJ8wms9TjnTuGGRNJbLBmSV
         xYtPDCT+Orfwazdb/hbWOfSNejv70TKQt0Q2WV/oJWnHQFjphEeBS1eWouyz5+Hbagft
         u4pWuombqGLKHrUS3u7RmkvTUx60MGFrBJllIURyrUaPfgbxP7leHsreyphKECPK99I9
         rD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aB8zojV5jEUefDuVJi0vR0YkG/U5cfNheMWVTqJjaIE=;
        b=Se5XavcYz5KhHI8UWVQk+ltJ3Ot/5qaa5CXkfvnNYmbknMUpUELBxhy0LxiWrRVrZZ
         s0+NCmnJothTKICaKsDk1O7zZ26kvZxRWK4VMMgQVgTE1qvWQfruZYRHCUEQg26piqdL
         jh/G1y9EUZkLe/OoYdIY0rEkFoWqeR5/a53I4Xgg58kQrPnbwb5y/7T4EjdHXb5MooOL
         prWtWM88DnY/gypADdqvd9c3SO1V8IR6F4mPFpTGVIn5KGLdj6TLQzThihqrFIoBRree
         zthk+IfNb9aJyG+YZqZ6OmBqGYin/JE5QbY0Hbsje+yRQ243cRLNPMw1wfTTq0gkHgNY
         Elpg==
X-Gm-Message-State: AJIora8oLn+dm4xrPgmLME2vddp5MurcX01a7j4wd42M0zbKeSka6shE
	j6L+6p4E7rj+VXR2bDHuS3RqkRV3E3aTmYHKuh0=
X-Google-Smtp-Source: AGRyM1thAfDbJZ/cSWDRQSiO+AbnVdMTpm8vR0qiog1KCx5aDTh9b9CIjY/cHxGuCq3cXR5GcweUzljBBNVCASc8hgg=
X-Received: by 2002:a05:6512:32c5:b0:47a:28a2:bfe with SMTP id
 f5-20020a05651232c500b0047a28a20bfemr32988lfg.239.1656093128866; Fri, 24 Jun
 2022 10:52:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdWz8=Zr8hnXNGBZVfe70F8oVdK670Z41=Dtib0GMDgAug@mail.gmail.com>
 <CAHk-=wiQzp+aurcmj15=LAa2ntvRZH0Ee2dn-PLjcFpmRE6Jcw@mail.gmail.com>
 <CAHmME9p+zRErOsvA1zC=kTHtpYD_sGjFxVsj0pMwteAp4dCdjQ@mail.gmail.com>
 <20220621165953.z25hwos7gom6bp6s@meerkat.local> <YrIEnmt5vDMcbOiG@zx2c4.com>
 <20220621182953.p5asczznnz3pn6dl@meerkat.local> <YrIR2v7GdC3qIt2E@zx2c4.com>
 <YrI3W46GUS/Dap5J@ripper> <YrT4LIq6ssD1mhMQ@mit.edu> <20220624135147.GA23621@ziepe.ca>
 <YrXYaE12VFUDucsN@mit.edu>
In-Reply-To: <YrXYaE12VFUDucsN@mit.edu>
From: Chuck Lever <chucklever@gmail.com>
Date: Fri, 24 Jun 2022 13:51:57 -0400
Message-ID: <CAFMMQGv8E2Bc4bdWG3_eLg5fiHX=gjerQ1s5x1_7f2uo9joZ+w@mail.gmail.com>
Subject: Re: b4-0.9.0 available
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Linus Torvalds <torvalds@linuxfoundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	tools@linux.kernel.org, users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 24, 2022 at 11:30 AM Theodore Ts'o <tytso@mit.edu> wrote:
>
> On Fri, Jun 24, 2022 at 10:51:47AM -0300, Jason Gunthorpe wrote:
> >
> > Unfortunately it is a bit of a PITA for the submitter so not too many
> > people seem to do it.
>
> Yeah, "git notes" in newer versions of git makes it easier to compose
> the cover letter, but tracking the lore URL's of the previous versions
> of the patches that was submitted has to be done completely manually.
> And because it's a PITA, very few people do it.
>
> It would be great if we had some kind of tooling where when someone
> sends a new version of the patch series, the tooling opened an editor
> and allowed the submitted to enter a quick changelog of what changed
> between the v25 and v26 version of the patch, with an option to also
> edit the body of the cover letter.  And then then when the patch is
> sent via e-mail, all of this would be appended to the cummulative
> version of the cover letter.

Interestingly, this kind of per-branch cover letter tracking has also
recently been requested for Stacked Git.

https://github.com/stacked-git/stgit/discussions/186

It would be great if the basic approach could be the same for git,
stgit, and b4.

-- 
"We cannot take our next breath without the exhale."
 -- Ellen Scott Grable
