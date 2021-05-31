Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2A6173
	for <tools@linux.kernel.org>; Mon, 31 May 2021 14:05:52 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 21F9717DB;
	Mon, 31 May 2021 10:05:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 31 May 2021 10:05:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=5z5OItDTW7J5xcopWCsZMxHSP+
	Ybz87JTJVvEO5CVKc=; b=p+ZUKuIRjGkCXRZ9dtitcuDwmvdptENNEX28PslrLg
	hF9kKzU7dHDLabnAPMtPDZYDUKYM+JJRxV2ZeTA4GszezgmeajwAt2lBYiSUTW6o
	qfBeXknyO8uvJswTvx/HuPrC/GsDCjrudBYolnXAnL/arz5KVmBfo5v24V5lGwef
	hXoMJRB6TF1VguccgF0rkgiF2UkvyCZrm/rlJ3WaSqghC6onT7Lj6hFT8wVL7x3G
	MjnN8vRrHdflL9yghJnj4ql/BXbx1sP8bTTPsWbCqYB+57KzD+lq0e9oAUOSw0eK
	uZ2TWz6RsyXV7RO9Jm625JhrfDv0naEt5W+Vl/kLbkoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5z5OItDTW7J5xcopW
	CsZMxHSP+Ybz87JTJVvEO5CVKc=; b=etm6G0mDvOtw+PIlmibe/0IBxEKjXcAsy
	cIZOGPu8oelC65c3J7q36mgDpnxYaxUUvhrUwkAXabOut9uAm0QnF+odjsV94mE6
	eyLxLDHwrSEzYBd7118LHqi4KZr3bLQLn+7OG/28ofqMZNfuLLhYueA6LHG0g0uJ
	dcCL8By7t40W0//zyXZJ677ssoCnMU/x4da5Ljjw4AEcsGfcC9zQOdc5VNr5iKS4
	DuXSS/RhCyGorlROHbOnIpVXbSxRp4b/fT+Ec5j6PVHeJNdk+qtDbW1E9s1VzQoN
	IAy1t52SmCElTsEbgyY+ZmYDbYOQSywsyqGyJ7aPP7ZFavt8qSSkA==
X-ME-Sender: <xms:P-20YM3jV9Kbci3b5avJK_m3MKX0AcxdNKL9pYPj25_9GmAspiVF1A>
    <xme:P-20YHFICJXuEH12_56MK-Iw7zyx08zxyXxOmiLjhdzF-Uhml2x4U42htnd_P_QBw
    eSLkjm0Qi5s74PuSPw>
X-ME-Received: <xmr:P-20YE62KKNEj36vnb7Yv6y4E4RdKiAPIYNoCuKwQGTua1xhWse_466wyujyQ5BnVFbIi1DiXDVCxNI7JjZvPT2yqvNguoE_KrRuiRzIJMXe6xajZa2gpm0DRaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelfedgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    etfeelleehueegjedugeeitddtvdffvdelfefgvddugeekudelgeduiefhieejudenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesph
    gsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:P-20YF0f6wTrjw0Zhw0BtXuxM1pmjzG7hbGURaZ-AELZErJLPrk13A>
    <xmx:P-20YPGsSSLSVALk_rh7emnJ1vwImb0h5p3bGH-eb3gPhk4kMCxb_g>
    <xmx:P-20YO_E0bfLWB7hZfPue00t8mnyuXsUOqbkIi9AGZrOD8Dr8zUthw>
    <xmx:P-20YFPZkRHSR-NudCHW4IxRQA0QvoBkGtb6sb9773jhK0VS5x3y6Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 May 2021 10:05:50 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
To: tools@linux.kernel.org,
	Konstantin Ryabitsev <konstantin.ryabitsev@linux.dev>
Cc: Paul Barker <paul@pbarker.dev>
Subject: [patatt][PATCH v2] Handle MIME encoded-word & other header manglings
Date: Mon, 31 May 2021 15:05:39 +0100
Message-Id: <20210531140539.7630-1-paul@pbarker.dev>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4612; h=from:subject; bh=Nn5k6dD3fmYY+q6baMZ35QiG//Qc1QgTczi1sZJZ2Sg=; b=owGbwMvMwCF2w7xIXuiX9CvG02pJDAlb3qrtfxKbvuwP25vJm1nrrWOjnJQCbXc36aVUWL/bc2hl iD1PRykLgxgHg6yYIsvu2bsuX3+wZGvvDelgmDmsTCBDGLg4BWAirn4M/xMu2tTNOv3jv0Dvudow9R n6E5n/fQg6NUN3/vPzIlPjImwZ/gdURHzRnJ+9YPUHHZ7TaZs+VOy1EHIyZjDV6HLrVb17jxsA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp; fpr=D2DDFDAE30017AF4CB62AA96A67255DFCCE62ECD
Content-Transfer-Encoding: 8bit

When testing patatt with patches sent to a sr.ht hosted mailing list, it
was found that long header lines (such as the X-Developer-Signature
line) were re-encoded using the MIME encoded-word syntax (RFC 2047) when
an mbox archive is generated, causing patatt to choke on the resulting
text which looks like this:

    X-Developer-Signature: v=1; a=openpgp-sha256; l=672; h=from:subject;
     bh=C40yOKgIfnNIUP+OW9WyPdBfljkZPpfUL1NepOODlx8=; =?utf-8?q?b=3DowGbwMvMwCF2?=
     =?utf-8?q?w7xIXuiX9CvG02pJDAmb67lTNi0+IeF97TL76vtKD7xjSjaluz0o/KfmZLX8rMi7_?=
     =?utf-8?q?l3M6O0pZGMQ4GGTFFFl2z951+fqDJVt7b0gHw8xhZQIZwsDFKQATydFhZJi+fFfvJ?=
     =?utf-8?q?8+0MF7GrfzWnP?=
     K7mAM/3n/r/UC+bprf6/g114QYGdbHcsaK7b1nanfA4IeZi1V0lL26cruXUWxgSEnNDP1FrAA=

Avoiding this issue by neatly wrapping the X-Developer-Signature header
before sending doesn't appear to be possible without making invasive
changes to git-send-email and/or the Net::SMTP perl module. The header
content generated by patatt is wrapped at 78 characters as can be seen
here from a locally signed patch file:

    X-Developer-Signature: v=1; a=openpgp-sha256; l=672; h=from:subject;
    bh=C40yOKgIfnNIUP+OW9WyPdBfljkZPpfUL1NepOODlx8=;
    b=owGbwMvMwCF2w7xIXuiX9CvG02pJDAmbN1xO2bT4hIT3tcvsq+8rPfCOKdmU7vag8J+ak9XysyLv
    Xs7p7ChlYRDjYJAVU2TZPXvX5esPlmztvSEdDDOHlQlkCAMXpwBMpG0Dw/9Kpzgpc8UsQwOPK/taW6
    dFnZyy5QlXPfNCC4WTc76ft9ZnZJjI37a17fP7sxvclKJ1tm36EhITcK62Pphje9KrmOxMJg4A

Running `git send-email --smtp-debug=1 0001.patch` shows that this is
joined into a single long line before the message is sent:

    Net::SMTP::_SSL=GLOB(0x5646fbdc3ac8)>>> X-Developer-Signature: v=1; a=openpgp-sha256; l=672; h=from:subject; bh=C40yOKgIfnNIUP+OW9WyPdBfljkZPpfUL1NepOODlx8=; b=owGbwMvMwCF2w7xIXuiX9CvG02pJDAmb571P2bT4hIT3tcvsq+8rPfCOKdmU7vag8J+ak9XysyLv Xs7p7ChlYRDjYJAVU2TZPXvX5esPlmztvSEdDDOHlQlkCAMXpwBM5JA3I8O5hP6Tqm7lJst0rldcux 1V7M4q8T5o1fPU6Zs+hxj+SjvN8D/DK3rn8b0m34/Xy388Yeu8jvFdJf/c6Y6LDU7Hulj01nAAAA==

So we need to accept that the X-Developer-Signature line may be quite
long and so may be re-encoded by a mail server or archiver.

The Python email.header module provides the decode_header() and
make_header() functions which can be used to handle MIME encoded-word
syntax or other header manglings which may occur. The decode_header()
function requires a str argument so we must decode our bytes before
using this function. Thankfully, RFC 2822 makes life easy here as it
says that all header content must be composed of US-ASCII characters
(see section 2.2 of the RFC) so decoding is straightforward. The header
content is re-encoded into bytes after un-mangling to avoid having to
modify every other location in patatt where the header content is
accessed.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
v1 -> v2:
    * Avoid unnecessary header decoding/parsing/re-encoding if it's not
      needed.
    * Ignore errors when decoding the header content into an ASCII
      string.
    * Tidy up the comment so things are easier to read.

 patatt/__init__.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/patatt/__init__.py b/patatt/__init__.py
index 460d282..b4018ab 100644
--- a/patatt/__init__.py
+++ b/patatt/__init__.py
@@ -91,7 +91,7 @@ class DevsigHeader:
 
     def from_bytes(self, hval: bytes) -> None:
         self.hval = DevsigHeader._dkim_canonicalize_header(hval)
-        hval = re.sub(rb'\s*', b'', hval)
+        hval = re.sub(rb'\s*', b'', self.hval)
         for chunk in hval.split(b';'):
             parts = chunk.split(b'=', 1)
             if len(parts) < 2:
@@ -392,6 +392,15 @@ class DevsigHeader:
 
     @staticmethod
     def _dkim_canonicalize_header(hval: bytes) -> bytes:
+        # Handle MIME encoded-word syntax or other types of header encoding if
+        # present. The decode_header() function requires a str argument (not
+        # bytes) so we must decode our bytes first, this is easy as RFC2822 (sec
+        # 2.2) says header fields must be composed of US-ASCII characters. The
+        # resulting string is re-encoded to allow further processing.
+        if b'?q?' in hval:
+            hval = hval.decode('ascii', errors='ignore')
+            hval = str(email.header.make_header(email.header.decode_header(hval)))
+            hval = hval.encode('utf-8')
         # We only do relaxed for headers
         #    o  Unfold all header field continuation lines as described in
         #       [RFC5322]; in particular, lines with terminators embedded in
-- 
2.31.1

