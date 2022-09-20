Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04147C;
	Tue, 20 Sep 2022 09:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 940C2C433C1;
	Tue, 20 Sep 2022 09:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663665051;
	bh=VXGWl9jByPZCmtt0X2EGTheputx5Ri54kmAxTUJiipI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f/EWDqrB3W2/3yG2ekx3g7AUQ9nLtkq20B2tnN6EXMpaWi8uqZWAO0VUWtJ3h0KPv
	 fANzumaaZxPs1+TmN+N/Q/fA47lIR0USRi5g1NoxQligW7fsN37MjK7jlqthGyyT1M
	 ZOnP86A+Bc92NZABe8sHc7bagzcMeZvuEVALU03BK44VwP4KiXEYic/Zm8SyNq40/6
	 O1hvSQJNIZM2WrnERF/nTokvu3mPmN40Gh1/aQQGAZms2leztriGdAPwkDxQaxE5uB
	 UOIb6+qcwcZSQwAFgpuIBv+GC5XCRafZcySHh7CN67OQ3Y9soyf2B6vQj1ta9WOCSJ
	 kB+0YrsOpvaFw==
Date: Tue, 20 Sep 2022 12:10:46 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 v0.10.0 is available
Message-ID: <YymDlmJG8fNhvHSY@unreal>
References: <20220916181319.okfskienqh6kfeor@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220916181319.okfskienqh6kfeor@meerkat.local>

Hi,

I got the following splat when tried ty functionality:

=E2=9E=9C  kernel git:(wip/leon-for-next) ~/src/b4/b4.sh ty -aS --dry-run
Auto-thankanating commits in wip/leon-for-next
Found 2 of your commits since 1.week
Calculating patch hashes, may take a moment...
  Located: [PATCH for-next 0/2] irdma for-next updates 9-7-2022
---
Generating 1 thank-you letters
  Sending: Re: [PATCH for-next 0/2] irdma for-next updates 9-7-2022
    --- DRYRUN: message follows ---
    | From: Leon Romanovsky <leon@kernel.org>
    | To: Shiraz Saleem <shiraz.saleem@intel.com>, Jason Gunthorpe <jgg@zie=
pe.ca>
    | Cc: linux-rdma@vger.kernel.org
    | In-Reply-To: <20220907191324.1173-1-shiraz.saleem@intel.com>
    | References: <20220907191324.1173-1-shiraz.saleem@intel.com>
    | Subject: Re: [PATCH for-next 0/2] irdma for-next updates 9-7-2022
    | Message-Id: <166366381168.86952.7578029482213151514.b4-ty@kernel.org>
    | Date: Tue, 20 Sep 2022 11:50:11 +0300
    | MIME-Version: 1.0
    | Content-Type: text/plain; charset=3D"utf-8"
    | Content-Transfer-Encoding: 8bit
    | X-Mailer: b4 0.11.0-dev-8af31
    |
    | On Wed, 7 Sep 2022 14:13:22 -0500, Shiraz Saleem wrote:
    | > This series adds udata inlen/outlen validation for the verb API's
    | > and fixes up completion error code reporting to ulp's.
    | >
    | > Shiraz Saleem (1):
    | >   RDMA/irdma: Validate udata inlen and outlen
    | >
    | > Sindhu-Devale (1):
    | >   RDMA/irdma: Align AE id codes to correct flush code and event
    | >
    | > [...]
    |
    | Applied, thanks!
    |
    | [1/2] RDMA/irdma: Align AE id codes to correct flush code and event
    |       commit: b6da0e79c495ba730223608f2791bc02c9af38b6
    | [2/2] RDMA/irdma: Validate udata inlen and outlen
    |       commit: b3cce21f46fe228dc5cc81c4b93ba25e3d873079
    |
    | Best regards,
    | --
    | Leon Romanovsky <leon@kernel.org>
    --- DRYRUN: message ends ---
Dry run, preserving tracked series.
---
DRYRUN: generated 1 thank-you letters
Traceback (most recent call last):
  File "/home/leonro/src/b4/b4/command.py", line 358, in <module>
    cmd()
  File "/home/leonro/src/b4/b4/command.py", line 341, in cmd
    cmdargs.func(cmdargs)
  File "/home/leonro/src/b4/b4/command.py", line 106, in cmd_ty
    b4.ty.main(cmdargs)
  File "/home/leonro/src/b4/b4/ty.py", line 674, in main
    auto_thankanator(cmdargs)
  File "/home/leonro/src/b4/b4/ty.py", line 378, in auto_thankanator
    send_messages(applied, wantbranch, cmdargs)
  File "/home/leonro/src/b4/b4/ty.py", line 469, in send_messages
    smtp.quit()
AttributeError: 'list' object has no attribute 'quit'

---------------------
My sendemail section:

   26 [sendemail]    =20
   27         smtpserver =3D /usr/local/bin/msmtp-enqueue.sh
   28         suppresscc =3D self
   29         chainReplyTo =3D false
   30         confirm =3D always
   31         from =3D Leon Romanovsky <leon@kernel.org>
   32         envelopeSender =3D Leon Romanovsky <leon@kernel.org>
   33         signingkey =3D leon@kernel.org
   34         composeencoding =3D utf-8
   35         # Rely on git-format-patch to generate message-id
   36         thread =3D false

Thanks
