Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794510617;
	b=5HMuCkuUzRNkt6evBQXgPkL+4T2G7K16bPNkB/31Ob1zI8pRkaXIqFB53nWGykmqclys
	 ksYNNwiv2ZaVUJ3v5sbNk65PXtjXGste13G/nuAaM5xmrM40zJXYlAlHZEvTKmIGGBESl
	 /hrln3CWXlmX1rIpE9L5S66Gg0p4n/9jGtNiZV+hTiE/X5Juw34ZR4WYtuKf3SaOmwC9Y
	 9DZqYlrb2sl5kgbL8FIEbj3QwbGbrfBCIRKVS49qA/IpSgf8Xi2y2M/TjdNDdqs1uYUy7
	 CMFPwE9mLrDe1vm/bMHMuvRty+z0UrqhheN847qT4XavlM5uacPymT8DQO991PqLE0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510617;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:X-ICL-RepId:
	 Dkim-Signature:mail-alias-created-date:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Info-Out:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-JNJ;
	bh=k4AgTlH12cGIxbFToWVnyH7PwB/waFZN/pLfxAxReJs=;
	b=NP9rSy3XFxKBa68GPZHS0akbiyCXduBhPQn8qVqKq6CgepCwk+OaIqQ23zJDTvYUn1Jf
	 RrF3NGtQJVvNkNVeVkgKQ/8gQj6titzjymq/nahO0DgS3x+AmmKCvfPWE2nw79j6VUgob
	 228k+dk14RpX5SUPbkzrINWD1RRijtQCrTd5lYYP9Vrmy4S8VUKo82uV6FwsFOmrFnuUv
	 D21NxETgJGjGvZMF4L9r2o5+a6UvgxCGjgBMIi+SRIhQ2yyJ5COyQF2XhqwP/IVZaCuTt
	 kukl+N0+seFA+PqYOYd5i5eoQOmy2b0k10Tce1x7ZDsA3Ny5suNL1TTIFCCUylSLrHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=bemoty.dev header.i=@bemoty.dev header.a=rsa-sha256 header.s=sig1 header.b=DW6uqJDE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29D9606A333
	for <tools@linux.kernel.org>; Thu, 12 Nov 2026 19:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bemoty.dev header.i=@bemoty.dev header.a=rsa-sha256 header.s=sig1 header.b=DW6uqJDE
Received: by smtp.kernel.org (Postfix)
	id E42CD1F000C4; Thu, 12 Nov 2026 19:10:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=57.103.74.225
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794510616;
	b=waT3GmmCdpHxgGBHZzoAo2fI820Z1Lhza3r9z540KV4jea73LiPbIZQwXAc+rxdcNsEU
	 U5WKMDyhHb+N0bENDQLaprUqAzaiLZVa3IfVIjo9H7lJlawpyd2unfpX2uehlir9nCczo
	 dUZmUA88m5HzolTq5MUdkVrfU441tKKl5J1A9POSrECCG0vZY7ZkB0diCao1rpI0UuJbq
	 uXdspTZ/irzoZpCyWx8ejBD8DjCg2WdTQRRHT/7YkAMBoMO/vllg494Vgy1deKGgAFwwK
	 erIPABHY/P60q1ybFzEy/GReGR6KlcBsGqPjL3bqB3RTDXIdBVKXVDL2GmgX1bs7oHw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794510616;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:
	 mail-alias-created-date:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Info-Out:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-JNJ;
	bh=k4AgTlH12cGIxbFToWVnyH7PwB/waFZN/pLfxAxReJs=;
	b=taKm4/Yf1zeqvkfbc3d0I50CQOVU/g15GmC9QzSLSNbHA3ywFjzb1/gRg1WwROOmnqqJ
	 ajbFMWSnwn6qnpxIHzOeN40Hd0TvZEMqQhtx2oOl7yAMh00Jf8YcpH6NBYoqhNXOOBq+N
	 3ZCQJEV3TtDPQarJBc14iu4jzB5HgNNuvVhYO6F4ql45JOu0qVUHuopkkziGdtqpfTZrL
	 nlUx3wJ6lMS9uVoEHl6irLIvB0UrilCLOlmaWztP6/QKGMXB9q+SyVMm1E5NRjUoLKjEo
	 6S1eJa82oCgMuR1sWMe6iUqDu5xWjujXx9YMc9sNsEq6qmq8wGq4uxNv8cT1g7iwxqQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=bemoty.dev header.i=@bemoty.dev header.a=rsa-sha256 header.s=sig1 header.b=DW6uqJDE;
	dmarc=pass header.from=bemoty.dev;
	spf=pass smtp.mailfrom=bemoty.dev;
	arc=none smtp.remote-ip=57.103.74.225
Received: from outbound.ms.icloud.com (ms-2004l-snip4-4.eps.apple.com [57.103.74.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 00EA61F000C5
	for <tools@kernel.org>; Thu, 12 Nov 2026 19:10:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bemoty.dev header.i=@bemoty.dev header.a=rsa-sha256 header.s=sig1 header.b=DW6uqJDE
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 00EA61F000C5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=bemoty.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bemoty.dev
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-5 (Postfix) with ESMTPS id 417DE1809FA5;
	Thu, 12 Nov 2026 19:10:14 +0000 (UTC)
X-ICL-RepId: 01a1d12a-eeaf-7683-99d2-b09693a21d12
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bemoty.dev; s=sig1; t=1794510615; x=1826046615; bh=k4AgTlH12cGIxbFToWVnyH7PwB/waFZN/pLfxAxReJs=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=DW6uqJDEh7cFvbtE0x3mPnZ+XdELLcYQdstPcim2Ri5vjvKZ+vcQfoLHjQmNB7XkOpANVYECb8JcPkFG4Yxgct8TcaErB51GHd10RCIrp+zUEfVkY6HxRCNXGi0G00+bbDMRCil9ucvcSGDYyQPvX4b0ax6BAht+rMFe24D4w5nKsscYaeKKnO7MHdJinTsgtuxfpiVjRj49/LIczTOHXA9qZaHrqPbqb3Ou+BmOs0y8UB/RTo5LeZeFueCbY7tfgVc2LKnAY9e701YP2/E4b7WsOlkmArm6l//084VA+Seb1wtXm3hipvgOWZ2a2qs3QXvaKL+3jAysksDFithG0w==
mail-alias-created-date: 1623092339287
Received: from binatz.tail1d9057.ts.net (unknown [17.156.208.39])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-5 (Postfix) with ESMTPSA id 0971E180DF4A;
	Thu, 12 Nov 2026 19:10:12 +0000 (UTC)
From: Joshua Winkler <josh@bemoty.dev>
To: tools@kernel.org
Cc: Joshua Winkler <josh@bemoty.dev>
Subject: [PATCH] Replace dead distro bug report links
Date: Thu, 12 Nov 2026 20:10:00 +0100
Message-ID: <20261112191000.162374-1-josh@bemoty.dev>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3NiBTYWx0ZWRfX63U2461nYX3C
 Y+RiPM4aj5liU0Hx5HMyPKRnGCQB1q34SCFLdhlanFKDEFKRmAfs8+rAEr3RpZMD8ZGrxYJ9KcV
 tgeSlVfH+pVgojIAsM0LqQNZbtVNM+yQbkX9SUjC4IAkjtSL0dpoHTwpKGt7UmQfL8i/YLUy8Ca
 mCmFhQkDU9YeCAPUdFy9WXWKIY9W5CSUDVBPElQzwHhgf25b74n1ResUpPxbWHXoVfG/JRtEVit
 /tfgh3y057365gw4GZPeSCJTETzZVaNe2o6QlEg7frs7qWDUOPTjn2yykWa7NeVndCAlttT1Loh
 bajg2yc4Ylx1DGJ2AsJxB2yHqbOM0wXpLl2vgxvGUGoWIJLMjawvSCE98p0OWc=
X-Authority-Info-Out: v=2.4 cv=GuLXaU1C c=1 sm=1 tr=0 ts=6af60f16
 cx=c_apl:c_pps:t_out a=kRaGL2Q7qLiahLf3O6OaIA==:117
 a=kRaGL2Q7qLiahLf3O6OaIA==:17 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=HxOO8S7qDNDRVQTpMkN7:22 a=Da-wPGOzCPo0rgK0bsWi:22 a=fxJcL_dCAAAA:8
 a=vTr9H3xdAAAA:8 a=Br9LfDWDAAAA:8 a=UApgNeDKAAAA:8 a=UXIAUNObAAAA:8
 a=xNf9USuDAAAA:8 a=20KFwNOVAAAA:8 a=KSb9T-wMAAAA:8 a=OkVtsdzpwUsmm2wgkJsA:9
 a=fasyu4nNmrhVRyehPdzp:22 a=a1s67YnXd6TbAZZNj1wK:22 a=KF4VuIdXkMyp4E_ug72i:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3NiBTYWx0ZWRfX/6SpOhxg8bdy
 PVNO1Wy5ein48hwy2F4M6e8B1yb9SwAszqTrrQuKG/mqN2WUnkJBpGC/SoHFrsDUqmDE6bBfU6D
 Ui51iiGagTmsEKA5ssm0so49b2tKhgY=
X-Proofpoint-ORIG-GUID: Gpw7db1rRoR5bURv1Lan_BeaKLbksauR
X-Proofpoint-GUID: Gpw7db1rRoR5bURv1Lan_BeaKLbksauR
X-JNJ: AAAAAAABPeBPw41/qnA1e7bMn26qj66QKrI8x2sNkQCfJ7VFjtePnysQhgNTWPnuGJMG2s
 CnVpKyBhs81+oVXYrugyAWmC9UdgRPOZKmcR0TEFfrlzzL9Yw2jZdrKd31oDGz9SDa5I2A
 XB2IU4Ef1Z8GMZ72TYe8VQ34j0epVKEE3TA8BuduDCIc+K+ZKHFedufp6OENPfXUNGYm+m
 vZRlQRYH7kVGZch8YfmZKKRanYNwIvrIqkk0PhRRHjAxioDuryktuA27k+I12YcNS0d9uz
 K8UyLXzL/yDcZ/TpNa6Yz+isVqOsDeL4RetIJ+HcgmVM9Ao8Dbux3YVHoZRQ/ZmcDyyD9C
 ARYC7BG8Hj5a6qhLevic5VwE6Qa4IPELohLohSA3hOtdV0BsqWJfOVBBCL4g6Pdja+DXfz
 Fbbc2VVyeARkd0lGndUZcBgCu4wgx/8fdxkHFjYTkw7oI3xVKPm8ZeM/on8uG5eXwSwZrA
 tz7/TuTqNWfYVnS3UVUvipW6cyfLHQ8915b5nXaQgO/6f4bbDxdP0hOAbp3qKNkFG+6eXV
 qIEy1LGQEgx3JiL9zc/A6iTfQ50vOsyLxUoC2j+qSFRJH1Mjsb+iyC8ofBTkbjv46S6vIl
 KwQLMwXQGM6lEZ9WJNR+UlPxVopje2AOu0Y7BSUVJU2K8ZHgR/ffOdG7nb8nXd3u59sR76
 ad/LfN518zMxhFz8a8rzZbvUyOwjFKT23mS11VMtp3Eqg6pkK7VxU1I6Yb1ZSodyC154Ta
 ZEnk0IZ0Tr3MfB+kGVNEursfvaWE8La5Vj1SuF0fOH65N87Q7Ft/tSKbcj+9cLueuv8zwp
 uu3D8bfklB59hytGf9SsF1KxczFogbt33lthDLGl3aZvneMpMPt4IkUF4p4woeFMXDo9SN
 wxUJhNjVVdu0xs6vSdVMDNPD70A4Yk/8z27qeWWqIZkAF4Rr3F7vhNg9m1atgF+txQ8S+M
 tcRA/QDCIjZkiC1q6ysP6KFm1xHVQh2vvt+PjfdNeFuHAkCgIQoR08JioLFciO3DY2E9Ju
 47DlePhd7pVJSAsiV1W5XI/YtiNVRjx9JC/3y+QcMygZ8MOBAjPH8Cp6vnu0j2goY3S/9c
 RsgUTKSPIYol1rVkSxh3TOlpS+XTt3rbrFG20KA6vLqevhOik9IafiXo2SpQRntwLs9nz5
 Yn3gpKz8hyO6/jCYM/lQ==

The Ubuntu help page returns 503, Arch moved to GitLab, and the old
Linux Mint page doesn't resolve at all. The new links should give
users a good place to start for bug reports.

Signed-off-by: Joshua Winkler <josh@bemoty.dev>
---
 content/faq.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/content/faq.rst b/content/faq.rst
index 82753d2..1f16b13 100644
--- a/content/faq.rst
+++ b/content/faq.rst
@@ -118,10 +118,10 @@ If you are running a kernel that came with your Linux distribution, then
 the right place to start is by reporting the problem through your
 distribution support channels. Here are a few popular choices:
 
-- `Ubuntu <https://help.ubuntu.com/stable/ubuntu-help/report-ubuntu-bug.html.en>`_
+- `Ubuntu <https://ubuntu.com/project/docs/contributors/qa-and-testing/report-a-bug/>`_
 - `Fedora Project <https://docs.fedoraproject.org/en-US/quick-docs/howto-file-a-bug/>`_
-- `Arch Linux <https://bugs.archlinux.org/>`_
-- `Linux Mint <https://projects.linuxmint.com/reporting-an-issue.html>`_
+- `Arch Linux <https://wiki.archlinux.org/title/Bug_reporting_guidelines>`_
+- `Linux Mint <https://linuxmint-troubleshooting-guide.readthedocs.io/en/latest/>`_
 - `Debian GNU/Linux <https://www.debian.org/Bugs/Reporting>`_
 - `Red Hat <https://bugzilla.redhat.com/>`_
 - `OpenSUSE <https://bugzilla.opensuse.org/>`_
-- 
2.56.1

