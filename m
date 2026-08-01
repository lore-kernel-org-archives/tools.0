Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C156020B80B
	for <tools@linux.kernel.org>; Sat,  1 Aug 2026 09:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785578060; cv=pass; b=bMYTrjpI1V71Bgn8xzktilQZTbWlsp6miUi18kqpNTafBifi6YiCkm5fn09ako5CyYR21F4QIWqsEaxBWWHxjpLq5hKm5ynj5GcO7eHvxqnbJCFQhUXTFjNxVTFFI/nU+y9qYhc8oFM/ucKKg9ESE5WFHa5xLO54HZC9o13uQ3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785578060; c=relaxed/simple;
	bh=3Z8lIK0nSbsbkbYZewiw4nsiBaSvTdY1L0KS4bzx8Z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dffZTinHFgYFEL6r3MJ3pDw3udk1rzlwrUXQ83eYfvXxfhEKRGcxKL5pq3IY5/5zqTP/+0Sju5lJ4K128k1Ypkkvi0vTdeMBa6eZGTPYbi3CEZwqtnYiyWzLO1VtMmCX6JJ3jnWG/gifMKNgqaRfT+2goLaQBC/YEWtORak1LKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=YPNFyxQS; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="YPNFyxQS"
Received: by smtp.kernel.org (Postfix)
	id 75F2F1F00ACA; Sat,  1 Aug 2026 09:54:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=213.160.73.56
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785578058;
	b=mTIKPRPXxj408QTeByM3d4aN0hRgvnFYA6WlP64RB07sNgR31r9plxl6F+SsJ247aIiy
	 rH3XtgE8JtfcKUEvvS/RHBsaAnX2pf37jcVB7nxOERb5gw8hHbNyFwdnXgigzJ/Xaq+pv
	 9rNFey+lTM0yScJVJtElPshoakVU5qKEYYbWMUnOwf1VqSJsTE+TGZu8b0vVGDUZQedXX
	 UYaDKwPrFWF39twil1TzcB/HGoHY4tBiX0VkIZ7CzGIY+7b052imP7WRWQ0Jwe54Vy8z1
	 AIX6e99zN4A/bE+5OULxdvYwyquhfYX51wRRXzX6J0JuzaFyx46iF7NN5MRKixg7wfA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785578058;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type;
	bh=31562uwLfTYNq6vgE78qecgqtQEB+BtbSBg2bmrtk2g=;
	b=Urw0tTq5J63I/a4zbT1dy0knUGxkhIgjUabjgDFxnAY8u2CJT1wzTEve9If0bgkI8xT1
	 i3zRksf4BKqXWO6Pv61m0tJyffzEEGfamwguoyFaaWF0wSp5jQWVHhh0s44h74A8x7kcV
	 3JGUiYIz/ltsylTDuFUtDL9xZRnNf3dDOUR8xIUg73K0AAWkyGWWAfM02pVA/rdKufYTD
	 t9Eig7DnL4goTo82uB6A5Y3UzbGJEWgri1GVkVN8FeGSezMoezPzZTHbHUU3ME8McCr9D
	 Y0csXZScFaQzl6lNbgEn5arhsdtURgLA6woK2gIpUhB/89tzDCGcUXjHraQxHtyLYoQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=YPNFyxQS;
	dmarc=pass header.from=narfation.org;
	spf=pass smtp.mailfrom=narfation.org;
	arc=none smtp.remote-ip=213.160.73.56
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9B5271F00AC4
	for <tools@kernel.org>; Sat,  1 Aug 2026 09:54:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=YPNFyxQS
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 9B5271F00AC4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: by dvalin.narfation.org (Postfix) id 3AD2620019;
	Sat, 01 Aug 2026 09:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1785578051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=31562uwLfTYNq6vgE78qecgqtQEB+BtbSBg2bmrtk2g=;
	b=YPNFyxQS7DoF+/7/wXiAfuu71tAm1xL0rMWtDeYulWx0q3ZGkWI1urZ/cAPM7I8DrAjlRN
	iSmuGKXoGTyoGIR3yRz7vlXqTTvW+KLR6bABP9ZUOnUyUjSkAYa0LQXHcVOxUZTg7rXIjC
	lJn4rzySb9f7Ejk9c3UGAjafIi7q/Pw=
From: Sven Eckelmann <sven@narfation.org>
To: David Lee <david.lee@trailofbits.com>, Kyle Zeng <kylebot@openai.com>
Cc: Dominik 'Disconnect3d' Czarnota <dominik.czarnota@trailofbits.com>,
 b.a.t.m.a.n@lists.open-mesh.org, linux-kernel@vger.kernel.org,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 "Kernel.org Tools" <tools@kernel.org>, Andy Whitcroft <apw@canonical.com>,
 Joe Perches <joe@perches.com>
Subject:
 Re: [PATCH] batman-adv: reject unrepresentable multicast TVLV offsets (+ b4
 check signed-off-problems)
Date: Sat, 01 Aug 2026 11:54:03 +0200
Message-ID: <3801416.R56niFO833@sven-desktop>
In-Reply-To: <20260731135222.566367-1-david.lee@trailofbits.com>
References: <20260731135222.566367-1-david.lee@trailofbits.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3933016.MHq7AAxBmi";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3933016.MHq7AAxBmi
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
Date: Sat, 01 Aug 2026 11:54:03 +0200
Message-ID: <3801416.R56niFO833@sven-desktop>
In-Reply-To: <20260731135222.566367-1-david.lee@trailofbits.com>
References: <20260731135222.566367-1-david.lee@trailofbits.com>
MIME-Version: 1.0

On Friday, 31 July 2026 15:52:22 CEST David Lee wrote:
> Signed-off-by: Kyle Zeng <kylebot@openai.com>

Another thing just realized (and for whatever reason it was not shown by b4): 
Who is Kyle Zeng <kylebot@openai.com> here (what does kylebot have to do 
with the patch)? David Lee <david.lee@trailofbits.com> is here marked as the 
author but didn't even Signed-off-by the patch. See 
https://docs.kernel.org/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin
(see the end of mail of pending things for this patch)



@Konstanin (Joe/Andy): Is it to be expected that 
`b4 review track 20260731135222.566367-1-david.lee@trailofbits.com` -> 
`b4 review tui` -> "review" -> "checks" patch doesn't show the Signed-off-by 
error in the checkpatch check view? When doing it manually, it works as 
expected:

$ b4 am 20260731135222.566367-1-david.lee@trailofbits.com
[..]
$ ./scripts/checkpatch.pl -q --terse --no-summary ./20260731_david_lee_batman_adv_reject_unrepresentable_multicast_tvlv_offsets.mbx
./20260731_david_lee_batman_adv_reject_unrepresentable_multicast_tvlv_offsets.mbx:52: ERROR: Missing Signed-off-by: line by nominal patch author 'David Lee <david.lee@trailofbits.com>'

$ b4 --version
0.15.2

The difference comes from the "--mailback" option which b4 adds also to 
checkpatch. I have therefore also Cc'ed Joe Perches and Andy Whitcroft because 
of this suppressed error. The following change would produce the output but I 
have no glue and just fiddled around with the script without understanding the 
bigger concept (of checkpatch and why b4 uses --mailback):

diff --git i/scripts/checkpatch.pl w/scripts/checkpatch.pl
index 7a846a3ea1273..ccb2ec78193e0 100755
--- i/scripts/checkpatch.pl
+++ w/scripts/checkpatch.pl
@@ -7846,12 +7846,6 @@ sub process {
 		exit(0);
 	}
 
-	# In mailback mode only produce a report in the negative, for
-	# things that appear to be patches.
-	if ($mailback && ($clean == 1 || !$is_patch)) {
-		exit(0);
-	}
-
 	# This is not a patch, and we are in 'no-patch' mode so
 	# just keep quiet.
 	if (!$chk_patch && !$is_patch) {
@@ -7902,6 +7896,12 @@ sub process {
 		}
 	}
 
+	# In mailback mode only produce a report in the negative, for
+	# things that appear to be patches.
+	if ($mailback && ($clean == 1 || !$is_patch)) {
+		exit(0);
+	}
+
 	print report_dump();
 	if ($summary && !($clean == 1 && $quiet == 1)) {
 		print "$filename " if ($summary_file);

(this is just to show the cause - not meant as anything which should be applied)

Regards,
	Sven
--nextPart3933016.MHq7AAxBmi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCam3COwAKCRBND3cr0xT1
y0m5AQChINdIzm/w0zU7bfoEbd9BJ5+g/WSUN+VWYEDRgtHNCwD+IW00Wn77OkYu
fXiFXJUuvzn420Zc+jPEKhYkJB01gw8=
=/H5g
-----END PGP SIGNATURE-----

--nextPart3933016.MHq7AAxBmi--



