Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7024626BDB5
	for <tools@linux.kernel.org>; Thu,  6 Mar 2025 19:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741288293; cv=none; b=PX/+X/iFzojCkwpmzkTrsfPsMZaa8wBJocB+ALtFdvS1aQR2W0fsTkIaAY6OxwAV24hUN9XCXgsuzr5qF/DmfjzmwvFB6FWWfB/DshxVG2kGIimLGJXNRPVsHa81d+SfaXuyH5Ryyo1cFPRpyWf1vGoeDRQ14VyzlAqS1+KMyfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741288293; c=relaxed/simple;
	bh=7APf/GmSAv/vM8+O8hKJB5G65MkpPcm7sA8I/0kT6W4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZjkti9sWW5ejvm8H4I8/LF9Q3BRsmQiPYPwjodCyAb+CwDAnafq9dZiPDcBbXpMzyPJVXsfAUFWKA8JerL/xbQbychkGKB1+3fKoMzOJUVgy/7Yt1nOM5Mpa66qTiqte3y1G2uDjGdT3ZDnp+9b3l63rfA2FvyMVjqwCe3abw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X9Q3KiFZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X9Q3KiFZ"
Received: by smtp.kernel.org (Postfix)
	id 66885C4CEE9; Thu,  6 Mar 2025 19:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B7E0C4CEE8;
	Thu,  6 Mar 2025 19:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741288293;
	bh=7APf/GmSAv/vM8+O8hKJB5G65MkpPcm7sA8I/0kT6W4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X9Q3KiFZjEsloW92yy8TmeDYhYAntzwtnOgSDoWyVUue9UhsH5smvko04DC9kOfBj
	 ZXWA3IbVNNZ1Ll1qlJbmqDMzaCZppHfShHVocAdWPadCI8UnRnDbCX5y0tUQtyOm2s
	 zTWhEJjTG69b+RR7wNWOSVJTF+jpa0+4UVcW3+NAdKvANgzMUMS49UhS+9hxtusVxD
	 ERiJM3uuEvamGtfZrQumZI7poAmaGxbBdjzKv2fdsqnF/JjD5XG88YJfbbkJOFJzCm
	 dOosm6sqnvX7VGY26WLZV68iAmS+NdT0gaDQsuOv0cA4I9Ht9qYI20UjXkU2ifpyXD
	 OwtUb+mf9Iw1A==
Date: Thu, 6 Mar 2025 20:11:30 +0100
From: Daniel Gomez <da.gomez@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>, tools@kernel.org
Cc: Chuck Lever <chuck.lever@oracle.com>, 
	Joel Granados <joel.granados@kernel.org>, kdevops@lists.linux.dev, Daniel Gomez <da.gomez@samsung.com>, 
	s.prabhu@samsung.com
Subject: Re: [PATCH v2 0/2] guestfs: bringup: fix networking issue for debian
 hosts
Message-ID: <wvivcnffxy26z7epqezuwvpwu2j35y7a2ykpybialbcjk7usug@as26osrx4amn>
References: <20250306-fix-bringup-network-v2-0-85298d7a0ba5@samsung.com>
 <Z8nV7bBKx988TE0E@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8nV7bBKx988TE0E@bombadil.infradead.org>

On Thu, Mar 06, 2025 at 09:05:49AM +0100, Luis Chamberlain wrote:
> On Thu, Mar 06, 2025 at 12:38:42PM +0000, Daniel Gomez wrote:
> > Add isc-dhcp-client as runtime guestfs dependency to fix the networking
> > issue when bring up images with virt-builder.
> > 
> > Include Joel's patch 03 [3] from his cleanup as dependency.
> > [3]
> > https://lore.kernel.org/all/ux4jlutnenwfc6dfj3om3tnq6jwxxvxumexznvegeq2l
> > l3obu6@ttujm2rtvtfv/
> > 
> > Finally, libguestfs was added as part of bringup_guestfs rather than
> > having it's own playbook. Other than the explicit runtime dependency
> > package list, libguestsfs is supported by normal distro package
> > manager installations and so, does not seem necessary to create another
> > playbook/role for this.
> > 
> > Note that when libguestfs was introduced in kdevops [1], no install-deps
> > like playbook/role, etc was added and my best guess is that new kdevops
> > installations/users are currently installing libguestfs manually
> > (vagrant playbook currently installs libguestfs-tools [2] for
> > RedHat/Fedora). So while fixing this for Debian, also add libguestfs
> > package support for Suse and RedHat/Fedora distros.
> > 
> > [1] 03b6eb1d34c16aa654f44e5668f0af9e075367d4 ("guestfs: add a new local
> > guest management variant")
> > 
> > [2] 99b78db71edbb01048f375030ff464e7f8faa024 ("install_vagrant: enhance
> > the redhat install")
> > 
> > Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> 
> SOBs are not required on patch cover letters. Other than that:

SOBs are automatically added in cover letters by b4.

Adding b4 mailing list to the thread.

Konstantin, following Luis and Greg suggestion in this other thread [2] on not
including Signed-off-by in cover letters, can we remove it from b4 cover letters
or default to not include it, and perhaps add an option for cases when it's
needed (if any)?

I propose doing something like this:

[2] https://lore.kernel.org/all/2025020847-boxcar-bovine-47e4@gregkh/

diff --git a/src/b4/command.py b/src/b4/command.py
index 5d90b4f..ff26bf9 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -307,6 +307,8 @@ def setup_parser() -> argparse.ArgumentParser:
                        help='Output prep-tracked commits as patches')
     spp_g.add_argument('--edit-cover', action='store_true', default=False,
                        help='Edit the cover letter in your defined $EDITOR (or core.editor)')
+    spp_g.add_argument('--add-sob-cover', action='store_true', default=False,
+                       help='Add SOB to the cover letter when created')
     spp_g.add_argument('--edit-deps', action='store_true', default=False,
                        help='Edit the series dependencies in your defined $EDITOR (or core.editor)')
     spp_g.add_argument('--check-deps', action='store_true', default=False,
diff --git a/src/b4/ez.py b/src/b4/ez.py
index de3fa42..ed20fe8 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -506,6 +506,9 @@ def start_new_series(cmdargs: argparse.Namespace) -> None:
     b4.git_set_config(None, f'branch.{branchname}.b4-prep-cover-strategy', strategy)

     if not cover:
+        sob_cover = ''
+        if cmdargs.add_sob_cover:
+            sob_cover = 'Signed-off-by: %s <%s>' % (usercfg.get('name', ''), usercfg.get('email', ''))
         # create a default cover letter and store it where the strategy indicates
         cover = ('EDITME: cover title for %s' % seriesname,
                  '',
@@ -527,7 +530,7 @@ def start_new_series(cmdargs: argparse.Namespace) -> None:
                  '# auto-populate the To: and Cc: trailers based on the code being',
                  '# modified.',
                  '',
-                 'Signed-off-by: %s <%s>' % (usercfg.get('name', ''), usercfg.get('email', '')),
+                 sob_cover,
                  '',
                  '',
                  )

If this makes sense to you, I can send a patch.

> 
> Thanks! So if isc-dhcp-client is already installed on the host, then
> this should not be an issue for new bringups right?

Correct.

> 
> Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
> 
>   Luis
