Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FE26D28
	for <tools@linux.kernel.org>; Wed, 14 Apr 2021 14:36:20 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id x11so21545536qkp.11
        for <tools@linux.kernel.org>; Wed, 14 Apr 2021 07:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5jAIRr+TE9K1j3iaaTezhlKlBxSpxCWBwjsv2Locwkc=;
        b=hoGrkmMly5tq7piZDbCU/PwpZQN8plm8klUu6Gld4J+ZJlkuIdNBTpW7v8/XyXWuqg
         +D1PDj7MEg1UyJIghhQK1LuUHM/BweLWajZy+js4ZG+QrO2dlpYaM4SJlx9ZcosKpxji
         8ivQTQuxrppwv2QY0JlIk6AfRiIPyj2TfWBqLeBovn/6EDQIAlmJRGKPQl7ADM8b9O1j
         8ksq5uWlxWTsPwsBu2XeSncBzxdbwbUN3SqB3MotqPlOs30rrJPZsONarqKR0EI+3Y5H
         DAffX32W3dUHP9fp6XpcJ8e2WFEsf88ldtA+O9EIzqElqZxrVZKI//u9z7HOaelUZiSW
         S8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5jAIRr+TE9K1j3iaaTezhlKlBxSpxCWBwjsv2Locwkc=;
        b=EEp7KGg+6Z+RxJCxbObP+P3QUvSk3+ru+MwyrRRkWEw8oJo/RbA/SGCPmPITNCj1Rj
         cUQivJ0gReLFVAmSIylSCIQfffGTsAoS5CdwAK2lW3oUl/7bZ8mRvaRFoeHv7aBYd/xF
         7Ljk/BPCF+y6Sycd0ycRHK1gsnArdAUBEsebEOsXL8OmD/y5OXiNUVqZZrd9JXtMCK0D
         opEhZnU/l6A+hEFRFtbe9Rn4zeV5JPjJSeEacYVLKpG4WwhOWvNT8UEcBh+27raw9km9
         rV9Y2N6+pvUpGTaQfELVkCBqgAkzefZR2hVMIBAt0VJb0vlxtxin3lPUuQyVrbphmEkn
         AlSw==
X-Gm-Message-State: AOAM530Vsn68txAEfauJv7uCHUSAinz3LdVziC4lIDxE2us5ZZhWleXZ
	Y8nsYG4nt6S+xbxuXoO99ofQaw==
X-Google-Smtp-Source: ABdhPJymaIvpILycBNrIjWJsaleo+E4AbPhvTejgFX0AI8r4DKZ1Zd78kN+n5cS9TK2QjgNKdbEoKQ==
X-Received: by 2002:a37:6493:: with SMTP id y141mr6737771qkb.200.1618410979222;
        Wed, 14 Apr 2021 07:36:19 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id p185sm4380145qke.10.2021.04.14.07.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 07:36:18 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1lWgcs-0068Bh-2T; Wed, 14 Apr 2021 11:36:18 -0300
Date: Wed, 14 Apr 2021 11:36:18 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Alex Elder <elder@ieee.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: RFC: Superseded-by: follow-up trailer
Message-ID: <20210414143618.GN227011@ziepe.ca>
References: <20210413204932.yovoa7njwc56jo5v@nitro.local>
 <fd732fc9-83a9-5502-fba5-f08317bdcaf3@ieee.org>
 <CAHmME9pFqm00ibpqhQQ9_P61F7mU12yrcOvdNSDYDz8ot8HJDg@mail.gmail.com>
 <20210413172901.1465307c@gandalf.local.home>
 <20210413214031.fenjvgh5helyuqdz@nitro.local>
 <YHaaMaa2uaa6HM9c@hirez.programming.kicks-ass.net>
 <20210414114950.GM227011@ziepe.ca>
 <2f6c16aea7593e25d51ed54501d462443d4b9012.camel@HansenPartnership.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f6c16aea7593e25d51ed54501d462443d4b9012.camel@HansenPartnership.com>

On Wed, Apr 14, 2021 at 06:57:13AM -0700, James Bottomley wrote:
> On Wed, 2021-04-14 at 08:49 -0300, Jason Gunthorpe wrote:
> > b4 does a nice job helping the maintainer, but the submitter has no
> > helpful common tooling currently.
> 
> We have git-format-patch/git-send-email. 

I think it is very poor. 

If you look at what a typical submitter has to deal with:

 - Make a series and write a cover letter. Version control the cover
   letter. In corporate cases many submitters should be getting internal
   review of everything, including the cover letter before sending.
   (Mostly I see people store the cover letter in git as an empty
   commit, easiest way to share for review)
 - Formulate the defined series and cover letter into a patch series
 - Annotate required To and CC's for the series and
   maintainers/reviewers. 

   Our tooling here is mediocre, we have get_maintainers but it is
   very hard to review/revise its output in the typical usage of just
   jamming it into git-send-email

   Little details like 'add the author and reviewers of the patches in
   the Fixes: lines' to the CC are often overlooked and are not
   automated.

   People seem to struggle to both narrow the CC list of individual
   patches series and still CC things like the cover letter to
   everyone.
 - Upload it to some public git so people can git fetch it
 - Submit it to SMTP, including using now required OAUTH. (Good luck!)
 - Keep a local copy of everything that was done.

 For v2:
 - Pull in all tags from the mailing list and update the git commits
   (b4 downloads the tags but doesn't automate fixing the local git
   branch)
 - Make required changes
 - Generate a change log and don't forget anything.

   git range-diff from the local copy of v1 is super helpful, but it
   is annoying to invoke git range-diff by hand.
 - Figure out the lore links of v1 to include in the cover letter
 - Revise the cover letter
 - Update the cc/to list to include discussion participants, people
   who gave reviewed-by/etc.
 - Send it again as v2

In all steps don't botch anything. Keep all the "state" related to the
submission in your head over a multiple weeks/months review cycle.

IMHO every single peice of information to drive the conversion of the
patch series to email should be stored in git itself, otherwise it
gets messed up/lost when it is revised/resent, and can't be reviewed
prior to submission.

git even makes very simple steps like editing the commit messages to
annotate tags/fix spelling overly difficult. Rebase with reword is a
pretty painfully way to do this.

The whole thing is quite hard and really time consuming - 'git
send-email' does almost none of what is needed and its operation of
relying on a huge list of unique command line arguments is not
effective.

I know people who send a lot of patches have their own custom work
flow scripts, but more casual people skip steps and do way too much
manual work, IMHO.

> description of git-format-email but I really think we should use more
> fields and make it automatic.  It would certainly be helpful if it
> tracked the last version sent of the same branch so I didn't have to
> add --version.  It can't, unfortunately, track message id's because
> that's generated by git-send-email (has to be that way because resends
> need different message id's).  

The thing invoking git-send-email can specify the message id, and it
can generate and track them using an acceptable algorithm. Other than
lacking OAUTH, git-send-email is an effective way to marshal a
directory of near-email format patches into SMTP.

For instance I've been using this algorithmic format for message id:

0-v1-6730d4ee0d32+40e6-gup_combine_put_jgg@nvidia.com
                       ^^^^^^^^^^^^^^^ my topic name
                  ^^^^ current time expressed as hex seconds since the
		       commit date
     ^^^^^^^^^^^^^ git commit in my tree that is at the top of what is
                   being sent
  ^^ Series sersion number
^  Patch number

Revises get new version numbers and new commit ids, resends get new
time stamps.

> The problem with the above is it's very fragile when done by two tools
> the latter of which might not be executed from the tree.  It really
> sounds like we need a combined tool for this, which includes the
> ability to resend patch series as well as to increment the version.

A single tool defaulting to supporting a narrow well defined
"acceptable" workflow would go along way to help the myriad of less
frequent submitters be more efficient.

Jason
