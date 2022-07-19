Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249FA186D
	for <tools@linux.kernel.org>; Tue, 19 Jul 2022 12:23:55 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id f24-20020a1cc918000000b003a30178c022so9796212wmb.3
        for <tools@linux.kernel.org>; Tue, 19 Jul 2022 05:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
        bh=Ky1xgeIdcCtQr+T1GfgoGeZkEAEa5lwj92guxROUbnA=;
        b=HE50zFge6O+2JkjPCXn5pF7ZsttdLeiLsqmx4rK8nB90fKzrL8aVUUNFRjHGXc+qwQ
         c5GW0b96wpuhQ+w3Qs4XFbWLiLbAkg27F0QQsFuTH5ZtJyUFCRVvp3Hvm/9Cgzh4r0Fz
         RvRf3NLoFZRnyY1GEDr/Se34jIm4Vn3D5FEJ0NnxiPaFwqtbf84JHeidY2m33oBksVal
         LGuuIsClgQyB068PIf//C5M0rvTcNaLwzHqrguTnnSOSQTT0CYI+DmGDdMIjFEYLn1Gg
         uR8F/kMRh5DKsq3Y8qAI9EmvDNAqxK7LMeJxyzrYL6feCnIlSL4PjT/BYGEpueNKK92h
         222g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=Ky1xgeIdcCtQr+T1GfgoGeZkEAEa5lwj92guxROUbnA=;
        b=PFQuTM2Th85wT2UJEwe/tpoQvHLmKp+9fxyX/MMwWfNvLSMfG16wwcBN0qr0X4kFDW
         44L5YEr8A3Mzi651AbFvI0nGIR93Gs5UlfPp83amuzvXhH659cf16eBc2IsGTherRGfw
         kblnQtSdRLWqNfBM6WILAhqnDhGo42nO7RW/+U8hErPHzDfsniPIuPRMC/oO9RVm+XuM
         52Kus8NL/9mM+e8mkEe5AqdXdpJR19v7cyjglV5iEfcnjhTIo5NAeJnedxDOlcYHjgJU
         S9i74Jwn+srTjD/OiL0MQApEEAJlaIc8AYzmuYZo3htxvlM7riiqZsLgU/QK/g7OcxqG
         056w==
X-Gm-Message-State: AJIora9hnWU40XDAZdDpdA0cNp2mhKuvnMy3wCXtEqddeqrA1VxwLafN
	tvWcwmyeYCW1SyLzRiBaK+x3JEbSo1xEWP/4
X-Google-Smtp-Source: AGRyM1vlVv3tXfEgH1/dFNqbzZVhCiF7QsI+TiavWiLJoEMakGtKjCEL89RyLM12Dm0k8+qqvk1KKA==
X-Received: by 2002:a05:600c:4fcc:b0:3a3:1be9:9651 with SMTP id o12-20020a05600c4fcc00b003a31be99651mr7751127wmq.142.1658233433948;
        Tue, 19 Jul 2022 05:23:53 -0700 (PDT)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id b17-20020a5d45d1000000b0021e4536a948sm222286wrs.79.2022.07.19.05.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 05:23:53 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
In-Reply-To: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
Date: Tue, 19 Jul 2022 14:23:52 +0200
Message-ID: <87ilnti947.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Konstantin,

First of all, thank you for this.
As an occasional kernel contributor I struggle with the current workflow.
I've never properly spend time automating any of this so I appreciate
the "b4 submit" initiative.

I think I've found a bug in the patch ordering result from
'b4 submit --send -o' or 'b4 submit --send --dry-run'.

The patch order is reverted when comparing with a classic "git format
patch" result.

Please find details below.

On Sat, Jul 16, 2022 at 10:29, Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

> Hello, all:
>
> I've committed the initial b4-submit features to the master branch, and I
> need some volunteers to test it. If you routinely send patches to the Linux
> kernel mailing lists, then I hope that volunteer is you. :)
>
> ## What it does
>
> The goal behind "b4 submit" is simplifying the submitter's workflow by
> automating away a lot of menial tasks, such as creating cover letters,
> collecting trailers, rerolling new revisions, remembering all the flags to
> git-format-patch and git-send-email, etc. The main workflow can be described
> like this:
>
> 1. b4 submit --new my-new-feature [-f v5.19-rc6]
>
> This will create a new branch called "b4/my-new-feature". If -f is not
> specified, the branch will be created from the current HEAD (but this is
> rarely what you want, so you'll want to pick a tag to work from).
>
> After the branch is created, b4 will create an empty commit that will serve to
> store the cover letter contents and some tracking information. You can view
> the raw commit with "git log" just like any other commit, and you can even
> edit it with "git rebase" but it's not recommended. It's much better to use
> "b4 submit --edit-cover".
>
> 2. b4 submit --edit-cover
>
> This allows you to work on the cover letter using $EDITOR or core.editor
> as defined in git-config. Once the editing is complete, the empty commit will
> be updated and the entire branch rebased using git-filter-repo.
>
> 3. use regular git operations for the rest of your work
>
> You can apply, rebase, edit, squash, etc -- just avoid touching the cover
> letter commit. You can also push the b4/my-new-feature branch to any remote
> and pull it from anywhere else if you want to switch computers.
>
> 4. b4 submit --send
>
> When you are ready to send off your series, you can review the resulting
> patches by running:
>
>   b4 submit --send --dry-run
>
> or
>
>   b4 submit --send -o /tmp/somedir

revision of b4:
 41cded9122f2 ("submit: store tracking info in the cover letter header")

git submodule status:
 0eb41be65707a1e156a59fd25ea9824c1a9e95ce patatt (v0.5.0-1-g0eb41be65707)


Steps to reproduce:

## prepare branch/work
$ b4 submit --new patch-ordering -f next-20220718
$ b4 submit --edit-cover # to remove EDITME and be able to use --dry-run/-o
$ touch oldest_file && git add oldest_file && git commit -s -m "oldest commit"
$ touch new_file && git add new_file && git commit -s -m "newer commit"
$ touch newest_file && git add newest_file && git commit -s -m "newest commit"

## this gives the following git log:
$ git log --oneline --no-decorate next-20220718..HEAD
d229ef49d3e9 newest commit
5eca0029017f newer commit
3e53e24f818e oldest commit
c48ebb144244 cover title for patch-ordering

## and is ordered as following with git format-patch:
$ mkdir format-patch
$ git format-patch -o format-patch next-20220718..HEAD
format-patch/0001-cover-title-for-patch-ordering.patch
format-patch/0002-oldest-commit.patch
format-patch/0003-newer-commit.patch
format-patch/0004-newest-commit.patch

## using b4 submit -o, we see that the order is not the same:
$ mkdir b4-submit
$ b4 submit --send --no-sign -o b4-submit 
Converted the branch to 3 patches
Populating the To: and Cc: fields with automatically collected addresses
  0000-cover-title-for-patch-ordering.patch
  0001-newest-commit.patch
  0002-newer-commit.patch
  0003-oldest-commit.patch

Is this the expected behaviour ?
To me, it seems that git format-patch gives the right order.

Thanks,
Mattijs

>
> The first will print out the patches to send on stdout, exactly as they would
> be fed to the SMTP server, and the second will output the patches into the
> specified directory a-la git-format-patch -- useful for running "checkpatch"
> or any other checks, as necessary.
>
> When you are satisfied that the patches are looking sane, you can fire off the
> actual --send command.
>
> NOTE: when we find a scripts/get_maintainer.pl in the repo toplevel, we will
> automatically run the most-recommended (that I could find) combination of
> flags to automatically populate the To: and Cc: list in addition to whatever
> we get out of the cover letter and commit trailers. You can turn this off with
> --no-auto-to-cc.
>
> NOTE: at this time, a working SMTP server and a valid [sendemail] section are
> required for sending patches. The web submission endpoint work is not yet
> completed.
>
> 5. b4 submit --reroll
>
> After you send your series and when you're ready to start working on a new
> revision, you'll want to --reroll to increment your tracked version. This will
> automatically update the cover letter commit to add a "Changes in v[N]"
> section that will also contain a link to the v[N-1] series, creating a
> historical breadcrumb of revisions.
>
> 6. b4 submit --update-trailers [--signoff]
>
> As you receive feedback on your patches, you can retrieve any received
> trailers from lore.kernel.org and apply them directly to your branch. This is
> accomplished by retrieving any threads matching the unique "change-id"
> submitted as part of the cover letter.
>
> One thing to keep in mind here is that actual trailer matching is done by
> comparing the patch-id (see git-patch-id for details). This has the following
> important bonuses and caveats:
>
>   - You can rearrange patches or modify summaries without it affecting the
>     match.
>   - If you modify actual code (even as much as fixing a typo in a string), any
>     received trailers will no longer match. This is as designed, because if
>     you change the code, it's no longer reviewed (but we won't remove any
>     existing trailers that were already applied).
>   - when you use --signoff, this will move your own "Signed-off-by" trailer
>     below any other trailers in all series commits, which is commonly
>     recommended for the chain-of-custody purposes.
>
> 7. b4 submit --send
>
> GOTO 4.
>
> In addition to the above, please see "b4 submit --help" for other flags you
> can use with these operations.
>
> ### Editing the cover letter commit manually
>
> If you ever need to edit the cover letter commit manually (e.g. to fix
> something about the tracking section json), you can use regular "git rebase
> -i" with the "reword" action. When rebase bails complaining about the empty
> commit, just run "git commit --amend --allow-empty" to edit the cover letter
> and then "git rebase --continue".
>
> Again, this is not recommended and it's best to always use "b4 submit
> --edit-cover".
>
> ## Getting the b4 dev version
>
> To install the b4 development version, you will need to run it from the git
> checkout:
>
>   git clone https://git.kernel.org/pub/scm/utils/b4/b4.git
>   cd b4
>   git submodule update --init
>   alias b4="$PWD/b4.sh"
>
> You can find out more details in the README file. You will also want to make
> sure that git-filter-repo is installed (either from your distro packages or
> from pip).
>
> If you're already running b4 from the git checkout, make sure you run "git
> submodule update" to pull in the latest unreleased patatt version.
>
> ## Feedback
>
> I hope you have a positive experience using b4 submit. I will be happy to
> receive any feedback, as I have to make a lot of assumptions and they aren't
> always the right ones. :) The best place for this feedback is on the
> tools@linux.kernel.org list.
>
> Best regards,
> Konstantin
