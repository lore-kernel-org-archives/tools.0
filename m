Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB402472AE
	for <tools@linux.kernel.org>; Thu,  9 Oct 2025 15:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760022832; cv=none; b=fpPbKjqGNx2ETBWlpXvMNWUO78aqqgz83mTjONox44tyMCxvE7XO6RC7/tYUSMU5dOQJVAlvHJNrWNzzBPmyt1+NLhV8ViGdCnDA+n93GOLHJlyWbuFo7//kRWv+XJyZx3I5+oJPMHXWrkISMYULPP3XHJ5vfsvamEbDHrimaWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760022832; c=relaxed/simple;
	bh=kIVdABzHXjpYdTGjqrkSR/qJR9VJPVbrSGi6QrWS/88=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ciDooKQfKtTKwmA/v4LIJhaaN2iqtYCf0Oc4kufBrBRYvOZpZ29v6tTM3QrhjsOkK/mbExHTrVQulY+VNAX3lMHfSBJHEVdBU0CcfOPywNhG+gy6b8UaodH6vPFw04wCTjmF9uaXTI/kD+WtqPOnuFFgazf6ZZOCX0/MhsIsNZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qHih1//k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qHih1//k"
Received: by smtp.kernel.org (Postfix)
	id 781CFC4CEF8; Thu,  9 Oct 2025 15:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF050C4CEE7
	for <tools@kernel.org>; Thu,  9 Oct 2025 15:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760022832;
	bh=kIVdABzHXjpYdTGjqrkSR/qJR9VJPVbrSGi6QrWS/88=;
	h=Date:From:To:Subject:From;
	b=qHih1//kk+Qy0UulzXGcFYTinMFE0DUtsBE1ldxGTR4+9X9gjRDxKCKnVTRBnOOxx
	 tyvVficz9/SH78aLINuq9oeD2BtydO0nZ4pV+N/D0bmagm8/DNV12LVOE9cEXXXEjO
	 kmL+wbhfdYOj0KZwJ+QarrpA4cZAGAbtCHLLwggRkRDdZbEflcPcuZNjrz3NPmL4Tj
	 0M57c9f4C+h4AqhpdrdXa/VO9+yHNZv3gvKk+nO0SNV5SZVxkDgf0RybBg6YX/ydCp
	 sz1i9Jc51bkD4SN9KgBGgsXG0iwdu8pbf4OkIrEUs0xUPnGUw/hScZWHLFcCWkWL2r
	 Ro9LSA4aTJHhw==
Date: Thu, 9 Oct 2025 16:13:49 +0100
From: Lee Jones <lee@kernel.org>
To: tools@kernel.org
Subject: b4: ty: User-flow regression
Message-ID: <20251009151349.GB2890766@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

For better or worse, I'm presently using the latest version of 0.15-dev,
specifically commit b87af2e0dc62 ("mbox: improve logging output for
shazam base selection") on the 'master' branch, which I recently rebased
to

After having done so, it seems as though my usual flow, which I've been
working with for a number of years, has stopped working reliably.  My
chosen flow goes like this:

-> Pipe mail from Mutt to a helper Bash script (apply-patch.sh)
-> Pull Message-Id out from mail
-> Use `b4 am` to save patch(es) to an *.mbox file
   -> b4.sh am -3 -st ${PATCHES} -o - ${id} > /tmp/<SANITISED_MSG_ID>.mbox
      * PATCHES is either "-P _" for single patches or "-P <RANGE>"
-> Run checkpatch.pl on the *.mbox file
   -> cat ${MBOX} | formail -ds ./scripts/checkpatch.pl || true
-> Apply the patch(es)
  -> cat ${MBOX} | git am -3 --reject
-> Amend / clean-up the commit messages as required
  -> kitty -o font_size=12 git rebase -i HEAD~${NOPATCHES}
-> Send out thank-yous
   -> b4.sh ty -aS --me-too --since=1.day

The that I'm highlighting occurs when changes have to be made to the
commit message.  My assumption is that the hash no longer matches and we
get:

 Auto-thankanating commits in for-mfd-next
 Found 5 of your commits since 1.day
 Calculating patch hashes, may take a moment...
 Nothing to do

Doh!  There should be something to do.

Did something change fairly recently to render this part of the
thank-you process less resilient to on-the-fly adaptions?  I don't
recall this happening before the update.

As ever, any help would be gratefully received.

-- 
Lee Jones [李琼斯]
